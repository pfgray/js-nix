import { pipe, Effect, Option } from "effect";
import { readUtf8File, stat, writeUtf8File } from "./fs";
import { parsePnpmLock } from "./converters/pnpm/pnpmConverter";
import { formatErrors } from "@effect/schema/TreeFormatter";
import * as adt from "ts-adt/MakeADT";
import { renderParsedLockFile } from "./renderParsedLockFile";

const program = pipe(
  parsePnpmLock,
  Effect.flatMap(
    Option.match({
      onNone: () => Effect.succeed({}),
      onSome: (pnpmLock) =>
        // writeUtf8File("js-nix-lock.json", JSON.stringify(pnpmLock, null, 2)),
        writeUtf8File("js-modules.nix", renderParsedLockFile(pnpmLock)),
    })
  )
);

const matchError = adt.makeMatch("type");

const matchResult = adt.makeMatch("_tag");

Effect.runCallback(
  program,
  matchResult({
    Failure: ({ cause }) =>
      pipe(
        cause,
        matchResult({
          Fail: ({ error }) =>
            pipe(
              error,
              matchError({
                JsonParseError: ({ value }) =>
                  console.log("json parse error", error),
                ParsePackageJsonError: ({ value }) => {
                  console.error(`Error parsing ${value.pkgJsonPath}:`);
                  console.error(formatErrors(value.error.errors));
                },
                ReadFileError: ({ context, value }) => {
                  console.error(`Error reading file ${context.path}`);
                  console.error(value);
                },
                WriteFileError: ({ context, value }) => {
                  console.error(`Error writing file ${context.path}`);
                  console.error(value);
                },
                YamlParseError: ({ context, value }) => {
                  console.error(`Error parsing yaml text:`);
                  console.error(context.yamlString);
                },
              })
            ),
          Interrupt: ({}) => console.log("interrupt", cause),
          Die: ({}) => console.log("die", cause),
          Annotated: ({}) => console.log("annotated", cause),
          Empty: ({}) => console.log("empty", cause),
          Parallel: ({}) => console.log("parallel", cause),
          Sequential: ({}) => console.log("sequential", cause),
        })
      ),
    Success: ({ value }) => {
      console.log("success", value);
    },
  })
);

Effect.runCallback(program, (result) => {
  if (result._tag === "Success") {
    console.log("success", result.value);
  } else {
    console.log("error", result);
    //if(result.cause._tag === "Fail")
    switch (result.cause._tag) {
      case "Fail":
        switch (result.cause.error.type) {
          case "JsonParseError":
        }
    }
  }
});
