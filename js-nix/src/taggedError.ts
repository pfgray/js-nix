import { pipe, Effect } from "effect";

export type TaggedError<E extends string, V> = {
  type: E;
  value: V;
};

export type TaggedErrorWithContext<E extends string, V, C> = {
  type: E;
  value: V;
  context: C;
};

export const taggedError =
  <E extends string, C = {}>(type: E) =>
  <V>(value: V): TaggedError<E, V> => ({
    type,
    value,
  });

export const taggedErrorC =
  <E extends string, C = {}>(type: E, context: C) =>
  <V>(value: V): TaggedErrorWithContext<E, V, C> => ({
    type,
    value,
    context,
  });

export interface MapEffError {
  <A, R, Y, Z, YY>(
    f: (a: A) => Effect.Effect<R, Y, Z>,
    map: (a: A) => (y: Y) => YY
  ): (a: A) => Effect.Effect<R, YY, Z>;
  <A, B, R, Y, Z, YY>(
    f: (a: A, b: B) => Effect.Effect<R, Y, Z>,
    map: (a: A, b: B) => (y: Y) => YY
  ): (a: A, b: B) => Effect.Effect<R, YY, Z>;
  <A, B, C, R, Y, Z, YY>(
    f: (a: A, b: B, c: C) => Effect.Effect<R, Y, Z>,
    map: (a: A, b: B, c: C) => (y: Y) => YY
  ): (a: A, b: B, c: C) => Effect.Effect<R, YY, Z>;
  <A, B, C, D, R, Y, Z, YY>(
    f: (a: A, b: B, c: C, d: D) => Effect.Effect<R, Y, Z>,
    map: (a: A, b: B, c: C, d: D) => (y: Y) => YY
  ): (a: A, b: B, c: C, d: D) => Effect.Effect<R, YY, Z>;
  <A, B, C, D, E, R, Y, Z, YY>(
    f: (a: A, b: B, c: C, d: D, e: E) => Effect.Effect<R, Y, Z>,
    map: (a: A, b: B, c: C, d: D, e: E) => (y: Y) => YY
  ): (a: A, b: B, c: C, d: D, e: E) => Effect.Effect<R, YY, Z>;
}

export const mapEffError: MapEffError = (f: Function, map: Function) => {
  return (...args: any[]) => {
    return pipe(
      f(...args),
      Effect.mapError((y) => map(...args)(y))
    );
  };
};
