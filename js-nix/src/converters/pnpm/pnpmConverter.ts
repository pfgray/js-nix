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
  PnpmLockSchema,
} from "./pnpmYaml";
import { ParsedPackage } from "../../ParsedPackage";
import { parseJson } from "../../parseJson";
import { PackageJsonSchema } from "../../PackageJson";
import { flow } from "effect/Function";
import { read } from "fs";
import { taggedError } from "../../taggedError";
import { formatErrors } from "@effect/schema/TreeFormatter";

const fixVersionStr = (versionString: string) => versionString.split("(")[0];

const formatDependencies = (
  pathName: string,
  dependencies?: ImporterDependencyMap
) => {
  return pipe(
    dependencies,
    Option.fromNullable,
    Option.map(
      flow(
        ReadonlyRecord.toEntries,
        Effect.forEach(([name, { version }]) => {
          if (version.startsWith("link:")) {
            return pipe(
              readPackageJson(
                path.join(pathName, version.slice(5), "package.json")
              ),
              Effect.map((p) => [name, p.version] as const)
            );
          } else {
            return Effect.succeed([name, fixVersionStr(version)] as const);
          }
        }),
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
const extractNameAndVersionFromPackageKey = (
  packageKeyIn: string
): { name: string; version: string } => {
  // remove first slash
  const packageKey = packageKeyIn.substring(1, packageKeyIn.length);
  const parts = packageKey.split("@");
  return packageKey.startsWith("@")
    ? {
        name: `@${parts[1]}`,
        version: parts[2],
      }
    : {
        name: parts[0],
        version: parts[1],
      };
};

const srcForPackage = (
  name: string,
  version: string,
  resolution: PackageResolution
) => {
  if ("tarball" in resolution) {
    throw new Error("Tarball not supported (TODO)");
    // return resolution.tarball;
  } else if ("commit" in resolution) {
    throw new Error("Commit not supported (TODO)");
    // return resolution.repo;
  } else {
    const tarball = `${name.split("/")[name.length - 1]}-${version}.tgz`;
    return {
      url: `https://registry.npmjs.org/${name}/-/${tarball}`,
      hash: resolution.integrity,
    };
  }
};

export const parsePnpmLock = pipe(
  readUtf8File("pnpm-lock.yaml"),
  Effect.flatMap(parseYaml),
  Effect.flatMap((lockFileRaw) =>
    pipe(
      S.parse(PnpmLockSchema)(lockFileRaw, { onExcessProperty: "ignore" }),
      Effect.mapError(taggedError("ParsePnpmLockError"))
    )
  ),
  Effect.map((lockFile) => ({ lockFile })),
  Effect.bind("local", ({ lockFile }) =>
    pipe(
      lockFile.importers,
      ReadonlyRecord.toEntries,
      Effect.forEach(([pathName, deps]) => {
        return pipe(
          Effect.Do,
          Effect.bind("pkgJson", () =>
            readPackageJson(path.join(pathName, "/package.json"))
          ),
          Effect.bind("dependencies", () =>
            formatDependencies(
              pathName,
              Object.assign({}, deps.devDependencies, deps.dependencies)
            )
          ),
          Effect.map(({ pkgJson, dependencies }) => ({
            type: "local" as const,
            src: path.join(".", pathName),
            name: pkgJson.name,
            version: pkgJson.version,
            dependencies: dependencies,
          }))
        );
      })
    )
  ),
  Effect.bind("remote", ({ lockFile }) =>
    pipe(
      lockFile.packages,
      ReadonlyRecord.toEntries,
      Effect.forEach(([packageKey, pkg]) => {
        // packageKey is something like: /@effect-ts/tracing-utils@0.3.0(typescript@5.1.6)
        const { name, version } =
          extractNameAndVersionFromPackageKey(packageKey);

        const dependencies = pipe(
          pkg.dependencies,
          Option.fromNullable,
          Option.match({
            onNone: () => ({}),
            onSome: ReadonlyRecord.map(([name, version]) =>
              fixVersionStr(version)
            ),
          })
        );

        return pipe(
          Effect.Do,
          Effect.map(({}) => ({
            type: "remote" as const,
            src: srcForPackage(name, version, pkg.resolution),
            name,
            version,
            dependencies,
          }))
        );
      })
    )
  ),
  Effect.map(({ local, remote, lockFile }) => ({ local, remote })),
  Effect.either,
  Effect.flatMap(
    Either.match({
      onLeft: (e) => {
        //console.log("error parsing pnpm lock file", e);
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
