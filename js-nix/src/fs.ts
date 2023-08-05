import * as fs from "fs";
import { nodeCallbackToEffect } from "./nodeCallback";
import { pipe, Effect } from "effect";
import { mapEffError, taggedError, taggedErrorC } from "./taggedError";
import { flow } from "effect/Function";

export const readFile = mapEffError(
  nodeCallbackToEffect<
    fs.PathOrFileDescriptor,
    BufferEncoding,
    NodeJS.ErrnoException,
    string
  >(fs.readFile),
  (path) => taggedErrorC("ReadFileError", { path })
);

const statBigInt_ = mapEffError(
  nodeCallbackToEffect<
    fs.PathLike,
    { bigint: true },
    NodeJS.ErrnoException,
    fs.BigIntStats
  >(fs.stat),
  (path) => taggedErrorC("StatError", { path })
);

export const statBigInt = (path: string) => statBigInt_(path, { bigint: true });

const stat_ = mapEffError(
  nodeCallbackToEffect<
    fs.PathLike,
    { bigint: false | undefined } | undefined,
    NodeJS.ErrnoException,
    fs.Stats
  >(fs.stat),
  (path) => taggedErrorC("StatError", { path })
);

export const stat = (path: string) => stat_(path, { bigint: false });

export const readUtf8File = (path: string) => readFile(path, "utf8");

export const writeFile = mapEffError(
  nodeCallbackToEffect<
    fs.PathOrFileDescriptor,
    string | NodeJS.ArrayBufferView,
    fs.WriteFileOptions,
    NodeJS.ErrnoException,
    void
  >(fs.writeFile),
  (path) => taggedErrorC("WriteFileError", { path })
);

export const writeUtf8File = (path: string, data: string) =>
  pipe(
    writeFile(path, data, "utf8"),
    Effect.map(() => undefined as unknown)
  );
