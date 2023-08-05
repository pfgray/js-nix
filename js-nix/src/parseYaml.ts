import { pipe, Effect } from "effect";
import * as yaml from "js-yaml";
import { taggedError, taggedErrorC } from "./taggedError";

export const parseYaml = (yamlString: string) =>
  pipe(
    Effect.try(() => yaml.load(yamlString)),
    Effect.mapError(taggedErrorC("YamlParseError", { yamlString }))
  );
