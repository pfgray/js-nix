import * as Effect from "@effect/io/Effect";

const program = Effect.sync(() => {
  console.log("Hello, World!");
});

Effect.runSync(program);
