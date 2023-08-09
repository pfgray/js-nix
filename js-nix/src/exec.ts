import * as fs from "fs";
import { nodeCallbackToEffect } from "./nodeCallback";
import { pipe, Effect } from "effect";
import { mapEffError, taggedError, taggedErrorC } from "./taggedError";
import { flow } from "effect/Function";
import * as child from "child_process";

export const exec = mapEffError(
  nodeCallbackToEffect(
    (
      cmd: string,
      cb: (error: any, val: { stdout: string; stderr: string }) => void
    ) => {
      child.exec(cmd, (err, stdout, stderr) => {
        cb(err, { stdout, stderr });
      });
    }
  ),
  (cmd) => taggedErrorC("ExecError", { cmd })
);
