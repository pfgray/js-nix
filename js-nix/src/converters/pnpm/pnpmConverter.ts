import * as path from "path";
import {
  Effect,
  pipe,
  ReadonlyRecord,
  ReadonlyArray,
  Option,
  Either,
} from "effect";
import { readUtf8File } from "../../fs";
import * as yaml from "js-yaml";
import { parseYaml } from "../../parseYaml";
import * as S from "@effect/schema/Schema";
import {
  ImporterDependencyMap,
  Package,
  PackageResolution,
  PnpmLock,
  PnpmLockSchema,
  isNpmPackage,
  isTarballPackage,
} from "./pnpmYaml";
import { parseJson } from "../../parseJson";
import { PackageJsonSchema } from "../../PackageJson";
import { flow } from "effect/Function";
import { read } from "fs";
import { taggedError } from "../../taggedError";
import { formatErrors } from "@effect/schema/TreeFormatter";
import { ParsedLockFile } from "../../ParsedPackage";
import { exec } from "../../exec";

const fixVersionStr = (versionString: string) => {
  return versionString.split("(")[0];
};

const resolveDependencyVersion2 = (lockFile: PnpmLock, pathName: string) => {};

type ErrorFrom<R> = R extends Effect.Effect<any, infer E, any> ? E : never;

const resolveGithubDependencyVersion = (
  lockFile: PnpmLock,
  name: string,
  version: string
) =>
  pipe(
    lockFile.packages[version],
    Option.fromNullable,
    Option.filter(isTarballPackage),
    Option.map((pkg) => pkg.version),
    Either.fromOption(() =>
      taggedError("GithubDependencyError")({
        msg: "Could not find github dependency",
        version,
      })
    ),
    Either.match({
      onLeft: (e) => Effect.fail(e),
      onRight: (version) => Effect.succeed([name, version] as const),
    })
  );

type ResolveDependencyVersionError =
  | ErrorFrom<ReturnType<typeof resolveGithubDependencyVersion>>
  | ErrorFrom<ReturnType<typeof readPackageJson>>;
const resolveDependencyVersion =
  (lockFile: PnpmLock, pathName: string) =>
  ([name, { version }]: [string, { version: string }]): Effect.Effect<
    never,
    ResolveDependencyVersionError,
    readonly [string, string]
  > => {
    if (version.startsWith("link:")) {
      return pipe(
        readPackageJson(path.join(pathName, version.slice(5), "package.json")),
        Effect.map((p) => [name, p.version] as const)
      );
    } else if (version.startsWith("github.com")) {
      console.log(
        "getting version from github dependency",
        lockFile.packages[version]
      );
      return resolveGithubDependencyVersion(lockFile, name, version);
    } else {
      return Effect.succeed([name, fixVersionStr(version)] as const);
    }
  };

const formatDependencies = (
  lockFile: PnpmLock,
  pathName: string,
  dependencies?: ImporterDependencyMap
) => {
  return pipe(
    dependencies,
    Option.fromNullable,
    Option.map(
      flow(
        ReadonlyRecord.toEntries,
        Effect.forEach(resolveDependencyVersion(lockFile, pathName)),
        Effect.map(ReadonlyRecord.fromEntries)
      )
    ),
    Option.getOrElse(() => Effect.succeed({}))
  );
};

const readPackageJson = (pkgJsonPath: string) =>
  pipe(
    readUtf8File(pkgJsonPath),
    Effect.flatMap(parseJson),
    Effect.flatMap((packageJson) =>
      pipe(
        S.parse(PackageJsonSchema)(packageJson, {
          onExcessProperty: "ignore",
        }),
        Effect.mapError((error) =>
          taggedError("ParsePackageJsonError")({ error, pkgJsonPath })
        )
      )
    )
  );

// /@effect-ts/tracing-utils@0.3.0(typescript@5.1.6)
export const extractNameAndVersionFromPackageKey = (
  packageKeyIn: string,
  pkg: Package
): { name: string; version: string } => {
  if (isTarballPackage(pkg)) {
    return { name: pkg.name, version: pkg.version };
  } else if (isNpmPackage(pkg)) {
    // remove first slash
    const packageKey = packageKeyIn.startsWith("/")
      ? packageKeyIn.substring(1, packageKeyIn.length)
      : packageKeyIn;
    const parts = packageKey.split("@");
    return packageKey.startsWith("@")
      ? {
          name: `@${parts[1]}`,
          version: parts[2].split("(")[0],
        }
      : {
          name: parts[0],
          version: parts[1].split("(")[0],
        };
  } else {
    throw new Error("Github packages not supported yet");
  }
};

const srcForPackage = (
  name: string,
  version: string,
  resolution: PackageResolution
) => {
  if ("tarball" in resolution) {
    return pipe(
      exec(
        `curl -sL ${resolution.tarball} | openssl dgst -binary -sha512 | openssl base64 -A`
      ),
      Effect.map(({ stdout }) => ({
        name: `${name}-${version}.tgz`,
        url: resolution.tarball,
        hash: `sha512-${stdout}`,
      }))
    );
    // throw new Error("Tarball not supported (TODO)");
    // return resolution.tarball;
  } else if ("commit" in resolution) {
    throw new Error("Commit not supported (TODO)");
    // return resolution.repo;
  } else {
    const parts = name.split("/");
    const tarball = `${parts[parts.length - 1]}-${version}.tgz`;
    return Effect.succeed({
      name: tarball,
      url: `https://registry.npmjs.org/${name}/-/${tarball}`,
      hash: resolution.integrity,
    });
  }
};

export const parsePnpmLock = pipe(
  readUtf8File("pnpm-lock.yaml"),
  Effect.flatMap(parseYaml),
  Effect.flatMap((lockFileRaw) => {
    return pipe(
      S.parse(PnpmLockSchema)(lockFileRaw, { onExcessProperty: "ignore" }),
      Effect.mapError(taggedError("ParsePnpmLockError"))
    );
  }),
  Effect.map((lockFile) => {
    return { lockFile };
  }),
  Effect.bind("local", ({ lockFile }) =>
    pipe(
      lockFile.importers,
      ReadonlyRecord.toEntries,
      Effect.forEach(([pathName, deps]) => {
        return pathName === "."
          ? Effect.succeed([])
          : pipe(
              Effect.Do,
              Effect.bind("pkgJson", () =>
                readPackageJson(path.join(pathName, "/package.json"))
              ),
              Effect.bind("dependencies", () =>
                formatDependencies(
                  lockFile,
                  pathName,
                  Object.assign({}, deps.devDependencies, deps.dependencies)
                )
              ),
              Effect.map(({ pkgJson, dependencies }) => [
                [
                  `${pkgJson.name}@${pkgJson.version}`,
                  {
                    type: "local" as const,
                    src: path.join(".", pathName),
                    name: pkgJson.name,
                    version: pkgJson.version,
                    dependencies: dependencies,
                  },
                ] as const,
              ])
            );
      }),
      Effect.map(ReadonlyArray.flatten),
      Effect.map(ReadonlyRecord.fromEntries)
    )
  ),
  Effect.bind("remote", ({ lockFile }) =>
    pipe(
      lockFile.packages,
      ReadonlyRecord.toEntries,
      Effect.forEach(([packageKey, pkg]) => {
        // packageKey is something like: /@effect-ts/tracing-utils@0.3.0(typescript@5.1.6)
        const { name, version } = extractNameAndVersionFromPackageKey(
          packageKey,
          pkg
        );

        const dependencies = pipe(
          pkg.dependencies,
          Option.fromNullable,
          Option.match({
            onNone: () => ({}),
            onSome: ReadonlyRecord.map((version, name) => {
              // if the version starts with "github.com"
              // then look it up in

              if (version.startsWith("github.com")) {
                return pipe(
                  lockFile.packages[version],
                  Option.fromNullable,
                  Option.filter(isTarballPackage),
                  Option.map((pkg) => pkg.version),
                  Option.getOrElse(() => version)
                );
              } else {
                return fixVersionStr(version);
              }
            }),
          })
        );

        return pipe(
          Effect.Do,
          Effect.bind("src", () =>
            srcForPackage(name, version, pkg.resolution)
          ),
          Effect.map(({ src }) => [
            [
              `${name}@${version}`,
              {
                type: "remote" as const,
                src,
                name,
                version,
                dependencies,
              },
            ] as const,
          ])
        );
      }),
      Effect.map(ReadonlyArray.flatten),
      Effect.map(ReadonlyRecord.fromEntries)
    )
  ),
  Effect.map(
    ({ local, remote, lockFile }): ParsedLockFile => ({ local, remote })
  ),
  Effect.either,
  Effect.flatMap(
    Either.match({
      onLeft: (e) => {
        if (e.type === "ParsePnpmLockError") {
          console.log("error parsing pnpm lock file", e);
          console.error(formatErrors(e.value.errors));
        }
        return e.type === "ParsePnpmLockError"
          ? Effect.succeedNone
          : Effect.fail(e);
      },
      onRight: Effect.succeedSome,
    })
  )
);
