import * as S from "@effect/schema/Schema";

export const PackageJsonSchema = S.struct({
  name: S.string,
  version: S.string,
});
