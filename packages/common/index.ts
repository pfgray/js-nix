
import { ADT } from "ts-adt";
import * as leftPad from 'left-pad';

export type Foo = ADT<{
  bar: { hmm: number },
  baz: { thing: string }
}>

console.log(leftPad("hmm", 10, "*"))