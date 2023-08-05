import { pipe, Effect } from "effect";
import { taggedError } from "./taggedError";

export const parseJson = (jsonString: string) =>
  pipe(
    Effect.try(() => JSON.parse(jsonString)),
    Effect.mapError(taggedError("JsonParseError"))
  );
