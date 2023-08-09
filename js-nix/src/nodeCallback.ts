import { pipe, Effect } from "effect";

export interface NodeCallbackToEffect {
  <A, Y, Z>(f: (a: A, cb: (error: Y | null, b: Z) => void) => void): (
    a: A
  ) => Effect.Effect<never, Y, Z>;
  <A, B, Y, Z>(f: (a: A, b: B, cb: (error: Y | null, c: Z) => void) => void): (
    a: A,
    b: B
  ) => Effect.Effect<never, Y, Z>;
  <A, B, C, Y, Z>(
    f: (a: A, b: B, c: C, cb: (error: Y | null, d: Z) => void) => void
  ): (a: A, b: B, c: C) => Effect.Effect<never, Y, Z>;
  <A, B, C, D, Y, Z>(
    f: (a: A, b: B, c: C, d: D, cb: (error: Y | null, e: Z) => void) => void
  ): (a: A, b: B, c: C, d: D) => Effect.Effect<never, Y, Z>;
  <A, B, C, D, E, Y, Z>(
    f: (
      a: A,
      b: B,
      c: C,
      d: D,
      e: E,
      cb: (error: Y | null, f: Z) => void
    ) => void
  ): (a: A, b: B, c: C, d: D, e: E) => Effect.Effect<never, Y, Z>;
}

export const nodeCallbackToEffect: NodeCallbackToEffect =
  (f: any) =>
  (...args: any[]) => {
    return Effect.async<never, unknown, unknown>((resolve) => {
      f(...args, (error: any, result: any) => {
        if (error) {
          resolve(Effect.fail(error));
        } else {
          resolve(Effect.succeed(result));
        }
      });
    });
  };
