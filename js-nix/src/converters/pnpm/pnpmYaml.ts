import { Effect, pipe } from "effect";
import { readUtf8File } from "../../fs";
import * as yaml from "js-yaml";
import { parseYaml } from "../../parseYaml";

import * as S from "@effect/schema/Schema";

const ImporterDependencySchema = S.struct({
  specifier: S.string,
  version: S.string,
});

export interface ImporterDependency
  extends S.To<typeof ImporterDependencySchema> {}

const ImporterDependencyMapSchema = S.record(
  S.string,
  ImporterDependencySchema
);
export interface ImporterDependencyMap
  extends S.To<typeof ImporterDependencyMapSchema> {}

const ImporterPackageSchema = S.struct({
  dependencies: S.optional(ImporterDependencyMapSchema),
  devDependencies: S.optional(ImporterDependencyMapSchema),
});

export interface ImporterPackage extends S.To<typeof ImporterPackageSchema> {}

const PackageResolutionSchema = S.union(
  S.struct({
    integrity: S.string,
  }),
  S.struct({
    tarball: S.string,
  }),
  S.struct({
    commit: S.string,
    repo: S.string,
  })
);

export type PackageResolution = S.To<typeof PackageResolutionSchema>;

const NpmPackageSchema = S.struct({
  resolution: S.struct({
    integrity: S.string,
  }),
  dependencies: S.optional(S.record(S.string, S.string)),
  peerDependencies: S.optional(S.record(S.string, S.string)),
});

const TarballPackageSchema = S.struct({
  resolution: S.struct({
    tarball: S.string,
  }),
  name: S.string,
  version: S.string,
  dependencies: S.optional(S.record(S.string, S.string)),
  peerDependencies: S.optional(S.record(S.string, S.string)),
});

const GitPackageSchema = S.struct({
  resolution: S.struct({
    commit: S.string,
    repo: S.string,
  }),
  dependencies: S.optional(S.record(S.string, S.string)),
  peerDependencies: S.optional(S.record(S.string, S.string)),
});

export interface TarballPackage extends S.To<typeof TarballPackageSchema> {}
export interface NpmPackage extends S.To<typeof NpmPackageSchema> {}
export interface GitPackageSchema extends S.To<typeof GitPackageSchema> {}

export const isTarballPackage = (pkg: Package): pkg is TarballPackage => {
  return "tarball" in pkg.resolution;
};

export const isNpmPackage = (pkg: Package): pkg is NpmPackage => {
  return "integrity" in pkg.resolution;
};

const PackageSchema = S.union(NpmPackageSchema, TarballPackageSchema);

export type Package = S.To<typeof PackageSchema>;

export const PnpmLockSchema = S.struct({
  importers: S.record(S.string, ImporterPackageSchema),
  packages: S.record(S.string, PackageSchema),
});

export interface PnpmLock extends S.To<typeof PnpmLockSchema> {}
