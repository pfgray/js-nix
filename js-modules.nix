{
  local = {
    "@test/client@1.0.0" = {
      type = "local";
      version = "1.0.0";
      name = "@test/client";
      src = ./packages/client;
      dependencies = {
        "gbt" = "0.0.3";
        "typescript" = "5.1.6";
        "@test/common" = "1.0.0";
      };
    };
    "@test/common@1.0.0" = {
      type = "local";
      version = "1.0.0";
      name = "@test/common";
      src = ./packages/common;
      dependencies = {
        "gbt" = "0.0.3";
        "typescript" = "5.1.6";
        "is-positive" = "3.1.0";
        "left-pad" = "1.3.0";
        "ts-adt" = "2.1.2";
      };
    };
    "@test/server@1.0.0" = {
      type = "local";
      version = "1.0.0";
      name = "@test/server";
      src = ./packages/server;
      dependencies = {
        "gbt" = "0.0.3";
        "typescript" = "5.1.6";
        "@test/common" = "1.0.0";
      };
    };
  };
  remote = {
    "@effect-ts/core@0.12.19" = {
      type = "remote";
      version = "0.12.19";
      name = "@effect-ts/core";
      src = {
        name = "core-0.12.19.tgz";
        url = "https://registry.npmjs.org/@effect-ts/core/-/core-0.12.19.tgz";
        hash = "sha512-Qg0fnKRiQo6xtzyADmY8O5PK96/kCdVYO1E8SnmMA2SnpyaPc/EvKlGblHdFTq07Cry239GbtngbmG2jJ5KEzg==";
      };
      dependencies = {
        "@effect-ts/system" = "0.10.18";
        "@effect-ts/tracing-utils" = "0.2.6";
      };
    };
    "@effect-ts/node@0.5.0" = {
      type = "remote";
      version = "0.5.0";
      name = "@effect-ts/node";
      src = {
        name = "node-0.5.0.tgz";
        url = "https://registry.npmjs.org/@effect-ts/node/-/node-0.5.0.tgz";
        hash = "sha512-zAYHJYfatgi9GxDBxcTV9bFHFqQHSxC1RTcNzlY4ItM/2qsE9cbc1wwGlZOPChMhdIvPUfOw8OcqI6el+TGWHA==";
      };
      dependencies = {
        "@effect-ts/core" = "0.12.19";
        "@effect-ts/tracing-utils" = "0.3.0";
      };
    };
    "@effect-ts/system@0.10.18" = {
      type = "remote";
      version = "0.10.18";
      name = "@effect-ts/system";
      src = {
        name = "system-0.10.18.tgz";
        url = "https://registry.npmjs.org/@effect-ts/system/-/system-0.10.18.tgz";
        hash = "sha512-oPMBvkZVAFf2Nj29NszpZpZ8jGAyBZi1ycrQwUabFp4mrk6oDv4t9DHfDlxbiWom1kmHz3FW/5Y8J2ExVgyXLA==";
      };
      dependencies = {
        "@effect-ts/tracing-utils" = "0.2.6";
      };
    };
    "@effect-ts/tracing-utils@0.2.6" = {
      type = "remote";
      version = "0.2.6";
      name = "@effect-ts/tracing-utils";
      src = {
        name = "tracing-utils-0.2.6.tgz";
        url = "https://registry.npmjs.org/@effect-ts/tracing-utils/-/tracing-utils-0.2.6.tgz";
        hash = "sha512-v4CNBAc3Hp3EDZIBToPT96lKbKXvjQnUVffqpY96dNiLHBdvnJU8CzOioHOzjqcJLleSGItZpIn5K/KXMtavkA==";
      };
      dependencies = {
        "typescript" = "5.1.6";
      };
    };
    "@effect-ts/tracing-utils@0.3.0" = {
      type = "remote";
      version = "0.3.0";
      name = "@effect-ts/tracing-utils";
      src = {
        name = "tracing-utils-0.3.0.tgz";
        url = "https://registry.npmjs.org/@effect-ts/tracing-utils/-/tracing-utils-0.3.0.tgz";
        hash = "sha512-NqOpSJRASJrB+UjyWILBUtBYQoesknVAXzJLc8aFXlTkF2wPbDrHeXziW6WcjG95dxF7BPlyo/N0vBCXTc6ojQ==";
      };
      dependencies = {
        "typescript" = "5.1.6";
      };
    };
    "@most/core@1.6.1" = {
      type = "remote";
      version = "1.6.1";
      name = "@most/core";
      src = {
        name = "core-1.6.1.tgz";
        url = "https://registry.npmjs.org/@most/core/-/core-1.6.1.tgz";
        hash = "sha512-H989BS6v9QxSZRGPZlbomXTRpUU60iy76AHJoPveKtj27bE0Pv3mwMENRzNZijJK9ntUwhoJ0SYCoXaMCYuWEQ==";
      };
      dependencies = {
        "@most/disposable" = "1.3.0";
        "@most/prelude" = "1.8.0";
        "@most/scheduler" = "1.3.0";
        "@most/types" = "1.1.0";
      };
    };
    "@most/disposable@1.3.0" = {
      type = "remote";
      version = "1.3.0";
      name = "@most/disposable";
      src = {
        name = "disposable-1.3.0.tgz";
        url = "https://registry.npmjs.org/@most/disposable/-/disposable-1.3.0.tgz";
        hash = "sha512-0lCve1GmWlZrvTGQpMgTFTHH6uRtzM31jyYTIN7303XX4KoLCLWw9L6hfTYLLBtge6s+QyiBQVokAhy2GjNAUQ==";
      };
      dependencies = {
        "@most/prelude" = "1.8.0";
        "@most/types" = "1.1.0";
      };
    };
    "@most/prelude@1.8.0" = {
      type = "remote";
      version = "1.8.0";
      name = "@most/prelude";
      src = {
        name = "prelude-1.8.0.tgz";
        url = "https://registry.npmjs.org/@most/prelude/-/prelude-1.8.0.tgz";
        hash = "sha512-t1CcURpZzfmBA6fEWwqmCqeNzWAj1w2WqEmCk/2yXMe/p8Ut000wFmVKMy8A1Rl9VVxZEZ5nBHd/pU0dR4bv/w==";
      };
      dependencies = {

      };
    };
    "@most/scheduler@1.3.0" = {
      type = "remote";
      version = "1.3.0";
      name = "@most/scheduler";
      src = {
        name = "scheduler-1.3.0.tgz";
        url = "https://registry.npmjs.org/@most/scheduler/-/scheduler-1.3.0.tgz";
        hash = "sha512-bbJGyhbZxNqlkVjP8+YT9wIVMvYnpzWOzV8jZueqlTH2PJWewH2f54YziZn7/wWa6AJdN03H1vb8Tbi9GcA/cw==";
      };
      dependencies = {
        "@most/prelude" = "1.8.0";
        "@most/types" = "1.1.0";
      };
    };
    "@most/types@1.1.0" = {
      type = "remote";
      version = "1.1.0";
      name = "@most/types";
      src = {
        name = "types-1.1.0.tgz";
        url = "https://registry.npmjs.org/@most/types/-/types-1.1.0.tgz";
        hash = "sha512-v2trqAWu1jqP4Yd/CyI1O6mAeJyygK1uJOrFRpNPkPZIaYw4khA4EQe4WzcyOFKuXdiP8qAqaxGtXXJJ2LZdXg==";
      };
      dependencies = {

      };
    };
    "@types/chokidar@2.1.3" = {
      type = "remote";
      version = "2.1.3";
      name = "@types/chokidar";
      src = {
        name = "chokidar-2.1.3.tgz";
        url = "https://registry.npmjs.org/@types/chokidar/-/chokidar-2.1.3.tgz";
        hash = "sha512-6qK3xoLLAhQVTucQGHTySwOVA1crHRXnJeLwqK6KIFkkKa2aoMFXh+WEi8PotxDtvN6MQJLyYN9ag9P6NLV81w==";
      };
      dependencies = {
        "chokidar" = "3.5.3";
      };
    };
    "@types/glob@7.2.0" = {
      type = "remote";
      version = "7.2.0";
      name = "@types/glob";
      src = {
        name = "glob-7.2.0.tgz";
        url = "https://registry.npmjs.org/@types/glob/-/glob-7.2.0.tgz";
        hash = "sha512-ZUxbzKl0IfJILTS6t7ip5fQQM/J3TJYubDm3nMbgubNNYS62eXeUpoLUC8/7fJNiFYHTrGPQn7hspDUzIHX3UA==";
      };
      dependencies = {
        "@types/minimatch" = "5.1.2";
        "@types/node" = "14.18.54";
      };
    };
    "@types/gradient-string@1.1.2" = {
      type = "remote";
      version = "1.1.2";
      name = "@types/gradient-string";
      src = {
        name = "gradient-string-1.1.2.tgz";
        url = "https://registry.npmjs.org/@types/gradient-string/-/gradient-string-1.1.2.tgz";
        hash = "sha512-zIet2KvHr2dkOCPI5ggQQ+WJVyfBSFaqK9sNelhgDjlE2K3Fu2muuPJwu5aKM3xoWuc3WXudVEMUwI1QWhykEQ==";
      };
      dependencies = {
        "@types/tinycolor2" = "1.4.3";
      };
    };
    "@types/ink-divider@2.0.2" = {
      type = "remote";
      version = "2.0.2";
      name = "@types/ink-divider";
      src = {
        name = "ink-divider-2.0.2.tgz";
        url = "https://registry.npmjs.org/@types/ink-divider/-/ink-divider-2.0.2.tgz";
        hash = "sha512-gY4kKSh1dNrZ++GQXW2KfMVexQfUsvE/LdUy7le5FSSeSemwk+u+ztHd+SMzfEjEHcCqpmRIQqKSrFOXLYCLHA==";
      };
      dependencies = {
        "@types/react" = "17.0.62";
      };
    };
    "@types/ink-gradient@2.0.1" = {
      type = "remote";
      version = "2.0.1";
      name = "@types/ink-gradient";
      src = {
        name = "ink-gradient-2.0.1.tgz";
        url = "https://registry.npmjs.org/@types/ink-gradient/-/ink-gradient-2.0.1.tgz";
        hash = "sha512-itcg0raINFVyexBQJVRkPopt/CLgBnDsqUi1JC096WquiD0NEBuKhtVvbvPiqJbtAffMAmtiXU24a5xSS0r1og==";
      };
      dependencies = {
        "@types/react" = "17.0.62";
      };
    };
    "@types/minimatch@5.1.2" = {
      type = "remote";
      version = "5.1.2";
      name = "@types/minimatch";
      src = {
        name = "minimatch-5.1.2.tgz";
        url = "https://registry.npmjs.org/@types/minimatch/-/minimatch-5.1.2.tgz";
        hash = "sha512-K0VQKziLUWkVKiRVrx4a40iPaxTUefQmjtkQofBkYRcoaaL/8rhwDWww9qWbrgicNOgnpIsMxyNIUM4+n6dUIA==";
      };
      dependencies = {

      };
    };
    "@types/node@14.18.54" = {
      type = "remote";
      version = "14.18.54";
      name = "@types/node";
      src = {
        name = "node-14.18.54.tgz";
        url = "https://registry.npmjs.org/@types/node/-/node-14.18.54.tgz";
        hash = "sha512-uq7O52wvo2Lggsx1x21tKZgqkJpvwCseBBPtX/nKQfpVlEsLOb11zZ1CRsWUKvJF0+lzuA9jwvA7Pr2Wt7i3xw==";
      };
      dependencies = {

      };
    };
    "@types/prop-types@15.7.5" = {
      type = "remote";
      version = "15.7.5";
      name = "@types/prop-types";
      src = {
        name = "prop-types-15.7.5.tgz";
        url = "https://registry.npmjs.org/@types/prop-types/-/prop-types-15.7.5.tgz";
        hash = "sha512-JCB8C6SnDoQf0cNycqd/35A7MjcnK+ZTqE7judS6o7utxUCg6imJg3QK2qzHKszlTjcj2cn+NwMB2i96ubpj7w==";
      };
      dependencies = {

      };
    };
    "@types/react@17.0.62" = {
      type = "remote";
      version = "17.0.62";
      name = "@types/react";
      src = {
        name = "react-17.0.62.tgz";
        url = "https://registry.npmjs.org/@types/react/-/react-17.0.62.tgz";
        hash = "sha512-eANCyz9DG8p/Vdhr0ZKST8JV12PhH2ACCDYlFw6DIO+D+ca+uP4jtEDEpVqXZrh/uZdXQGwk7whJa3ah5DtyLw==";
      };
      dependencies = {
        "@types/prop-types" = "15.7.5";
        "@types/scheduler" = "0.16.3";
        "csstype" = "3.1.2";
      };
    };
    "@types/scheduler@0.16.3" = {
      type = "remote";
      version = "0.16.3";
      name = "@types/scheduler";
      src = {
        name = "scheduler-0.16.3.tgz";
        url = "https://registry.npmjs.org/@types/scheduler/-/scheduler-0.16.3.tgz";
        hash = "sha512-5cJ8CB4yAx7BH1oMvdU0Jh9lrEXyPkar6F9G/ERswkCuvP4KQZfZkSjcMbAICCpQTN4OuZn8tz0HiKv9TGZgrQ==";
      };
      dependencies = {

      };
    };
    "@types/tinycolor2@1.4.3" = {
      type = "remote";
      version = "1.4.3";
      name = "@types/tinycolor2";
      src = {
        name = "tinycolor2-1.4.3.tgz";
        url = "https://registry.npmjs.org/@types/tinycolor2/-/tinycolor2-1.4.3.tgz";
        hash = "sha512-Kf1w9NE5HEgGxCRyIcRXR/ZYtDv0V8FVPtYHwLxl0O+maGX0erE77pQlD0gpP+/KByMZ87mOA79SjifhSB3PjQ==";
      };
      dependencies = {

      };
    };
    "@types/yargs-parser@21.0.0" = {
      type = "remote";
      version = "21.0.0";
      name = "@types/yargs-parser";
      src = {
        name = "yargs-parser-21.0.0.tgz";
        url = "https://registry.npmjs.org/@types/yargs-parser/-/yargs-parser-21.0.0.tgz";
        hash = "sha512-iO9ZQHkZxHn4mSakYV0vFHAVDyEOIJQrV2uZ06HxEPcx+mt8swXoZHIbaaJ2crJYFfErySgktuTZ3BeLz+XmFA==";
      };
      dependencies = {

      };
    };
    "@types/yargs@16.0.5" = {
      type = "remote";
      version = "16.0.5";
      name = "@types/yargs";
      src = {
        name = "yargs-16.0.5.tgz";
        url = "https://registry.npmjs.org/@types/yargs/-/yargs-16.0.5.tgz";
        hash = "sha512-AxO/ADJOBFJScHbWhq2xAhlWP24rY4aCEG/NFaMvbT3X2MgRsLjhjQwsn0Zi5zn0LG9jUhCCZMeX9Dkuw6k+vQ==";
      };
      dependencies = {
        "@types/yargs-parser" = "21.0.0";
      };
    };
    "@types/yoga-layout@1.9.2" = {
      type = "remote";
      version = "1.9.2";
      name = "@types/yoga-layout";
      src = {
        name = "yoga-layout-1.9.2.tgz";
        url = "https://registry.npmjs.org/@types/yoga-layout/-/yoga-layout-1.9.2.tgz";
        hash = "sha512-S9q47ByT2pPvD65IvrWp7qppVMpk9WGMbVq9wbWZOHg6tnXSD4vyhao6nOSBwwfDdV2p3Kx9evA9vI+XWTfDvw==";
      };
      dependencies = {

      };
    };
    "ansi-escapes@4.3.2" = {
      type = "remote";
      version = "4.3.2";
      name = "ansi-escapes";
      src = {
        name = "ansi-escapes-4.3.2.tgz";
        url = "https://registry.npmjs.org/ansi-escapes/-/ansi-escapes-4.3.2.tgz";
        hash = "sha512-gKXj5ALrKWQLsYG9jlTRmR/xKluxHV+Z9QEwNIgCfM1/uwPMCuzVVnh5mwTd+OuBZcwSIMbqssNWRm1lE51QaQ==";
      };
      dependencies = {
        "type-fest" = "0.21.3";
      };
    };
    "ansi-regex@5.0.1" = {
      type = "remote";
      version = "5.0.1";
      name = "ansi-regex";
      src = {
        name = "ansi-regex-5.0.1.tgz";
        url = "https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz";
        hash = "sha512-quJQXlTSUGL2LH9SUXo8VwsY4soanhgo6LNSm84E1LBcE8s3O0wpdiRzyR9z/ZZJMlMWv37qOOb9pdJlMUEKFQ==";
      };
      dependencies = {

      };
    };
    "ansi-styles@3.2.1" = {
      type = "remote";
      version = "3.2.1";
      name = "ansi-styles";
      src = {
        name = "ansi-styles-3.2.1.tgz";
        url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.1.tgz";
        hash = "sha512-VT0ZI6kZRdTh8YyJw3SMbYm/u+NqfsAxEpWO0Pf9sq8/e94WxxOpPKx9FR1FlyCtOVDNOQ+8ntlqFxiRc+r5qA==";
      };
      dependencies = {
        "color-convert" = "1.9.3";
      };
    };
    "ansi-styles@4.3.0" = {
      type = "remote";
      version = "4.3.0";
      name = "ansi-styles";
      src = {
        name = "ansi-styles-4.3.0.tgz";
        url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz";
        hash = "sha512-zbB9rCJAT1rbjiVDb2hqKFHNYLxgtk8NURxZ3IZwD3F6NtxbXZQCnnSi1Lkx+IDohdPlFp222wVALIheZJQSEg==";
      };
      dependencies = {
        "color-convert" = "2.0.1";
      };
    };
    "anymatch@3.1.3" = {
      type = "remote";
      version = "3.1.3";
      name = "anymatch";
      src = {
        name = "anymatch-3.1.3.tgz";
        url = "https://registry.npmjs.org/anymatch/-/anymatch-3.1.3.tgz";
        hash = "sha512-KMReFUr0B4t+D+OBkjR3KYqvocp2XaSzO55UcB6mgQMd3KbcE+mWTyvVV7D/zsdEbNnV6acZUutkiHQXvTr1Rw==";
      };
      dependencies = {
        "normalize-path" = "3.0.0";
        "picomatch" = "2.3.1";
      };
    };
    "astral-regex@2.0.0" = {
      type = "remote";
      version = "2.0.0";
      name = "astral-regex";
      src = {
        name = "astral-regex-2.0.0.tgz";
        url = "https://registry.npmjs.org/astral-regex/-/astral-regex-2.0.0.tgz";
        hash = "sha512-Z7tMw1ytTXt5jqMcOP+OQteU1VuNK9Y02uuJtKQ1Sv69jXQKKg5cibLwGJow8yzZP+eAc18EmLGPal0bp36rvQ==";
      };
      dependencies = {

      };
    };
    "auto-bind@4.0.0" = {
      type = "remote";
      version = "4.0.0";
      name = "auto-bind";
      src = {
        name = "auto-bind-4.0.0.tgz";
        url = "https://registry.npmjs.org/auto-bind/-/auto-bind-4.0.0.tgz";
        hash = "sha512-Hdw8qdNiqdJ8LqT0iK0sVzkFbzg6fhnQqqfWhBDxcHZvU75+B+ayzTy8x+k5Ix0Y92XOhOUlx74ps+bA6BeYMQ==";
      };
      dependencies = {

      };
    };
    "balanced-match@1.0.2" = {
      type = "remote";
      version = "1.0.2";
      name = "balanced-match";
      src = {
        name = "balanced-match-1.0.2.tgz";
        url = "https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.2.tgz";
        hash = "sha512-3oSeUO0TMV67hN1AmbXsK4yaqU7tjiHlbxRDZOpH0KW9+CeX4bRAaX0Anxt0tx2MrpRpWwQaPwIlISEJhYU5Pw==";
      };
      dependencies = {

      };
    };
    "binary-extensions@2.2.0" = {
      type = "remote";
      version = "2.2.0";
      name = "binary-extensions";
      src = {
        name = "binary-extensions-2.2.0.tgz";
        url = "https://registry.npmjs.org/binary-extensions/-/binary-extensions-2.2.0.tgz";
        hash = "sha512-jDctJ/IVQbZoJykoeHbhXpOlNBqGNcwXJKJog42E5HDPUwQTSdjCHdihjj0DlnheQ7blbT6dHOafNAiS8ooQKA==";
      };
      dependencies = {

      };
    };
    "brace-expansion@1.1.11" = {
      type = "remote";
      version = "1.1.11";
      name = "brace-expansion";
      src = {
        name = "brace-expansion-1.1.11.tgz";
        url = "https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz";
        hash = "sha512-iCuPHDFgrHX7H2vEI/5xpz07zSHB00TpugqhmYtVmMO6518mCuRMoOYFldEBl0g187ufozdaHgWKcYFb61qGiA==";
      };
      dependencies = {
        "balanced-match" = "1.0.2";
        "concat-map" = "0.0.1";
      };
    };
    "braces@3.0.2" = {
      type = "remote";
      version = "3.0.2";
      name = "braces";
      src = {
        name = "braces-3.0.2.tgz";
        url = "https://registry.npmjs.org/braces/-/braces-3.0.2.tgz";
        hash = "sha512-b8um+L1RzM3WDSzvhm6gIz1yfTbBt6YTlcEKAvsmqCZZFw46z626lVj9j1yEPW33H5H+lBQpZMP1k8l+78Ha0A==";
      };
      dependencies = {
        "fill-range" = "7.0.1";
      };
    };
    "chalk@2.4.2" = {
      type = "remote";
      version = "2.4.2";
      name = "chalk";
      src = {
        name = "chalk-2.4.2.tgz";
        url = "https://registry.npmjs.org/chalk/-/chalk-2.4.2.tgz";
        hash = "sha512-Mti+f9lpJNcwF4tWV8/OrTTtF1gZi+f8FqlyAdouralcFWFQWF2+NgCHShjkCb+IFBLq9buZwE1xckQU4peSuQ==";
      };
      dependencies = {
        "ansi-styles" = "3.2.1";
        "escape-string-regexp" = "1.0.5";
        "supports-color" = "5.5.0";
      };
    };
    "chalk@4.1.2" = {
      type = "remote";
      version = "4.1.2";
      name = "chalk";
      src = {
        name = "chalk-4.1.2.tgz";
        url = "https://registry.npmjs.org/chalk/-/chalk-4.1.2.tgz";
        hash = "sha512-oKnbhFyRIXpUuez8iBMmyEa4nbj4IOQyuhc/wy9kY7/WVPcwIO9VA668Pu8RkO7+0G76SLROeyw9CpQ061i4mA==";
      };
      dependencies = {
        "ansi-styles" = "4.3.0";
        "supports-color" = "7.2.0";
      };
    };
    "chokidar@3.5.3" = {
      type = "remote";
      version = "3.5.3";
      name = "chokidar";
      src = {
        name = "chokidar-3.5.3.tgz";
        url = "https://registry.npmjs.org/chokidar/-/chokidar-3.5.3.tgz";
        hash = "sha512-Dr3sfKRP6oTcjf2JmUmFJfeVMvXBdegxB0iVQ5eb2V10uFJUCAS8OByZdVAyVb8xXNz3GjjTgj9kLWsZTqE6kw==";
      };
      dependencies = {
        "anymatch" = "3.1.3";
        "braces" = "3.0.2";
        "glob-parent" = "5.1.2";
        "is-binary-path" = "2.1.0";
        "is-glob" = "4.0.3";
        "normalize-path" = "3.0.0";
        "readdirp" = "3.6.0";
      };
    };
    "ci-info@2.0.0" = {
      type = "remote";
      version = "2.0.0";
      name = "ci-info";
      src = {
        name = "ci-info-2.0.0.tgz";
        url = "https://registry.npmjs.org/ci-info/-/ci-info-2.0.0.tgz";
        hash = "sha512-5tK7EtrZ0N+OLFMthtqOj4fI2Jeb88C4CAZPu25LDVUgXJ0A3Js4PMGqrn0JU1W0Mh1/Z8wZzYPxqUrXeBboCQ==";
      };
      dependencies = {

      };
    };
    "cli-boxes@2.2.1" = {
      type = "remote";
      version = "2.2.1";
      name = "cli-boxes";
      src = {
        name = "cli-boxes-2.2.1.tgz";
        url = "https://registry.npmjs.org/cli-boxes/-/cli-boxes-2.2.1.tgz";
        hash = "sha512-y4coMcylgSCdVinjiDBuR8PCC2bLjyGTwEmPb9NHR/QaNU6EUOXcTY/s6VjGMD6ENSEaeQYHCY0GNGS5jfMwPw==";
      };
      dependencies = {

      };
    };
    "cli-cursor@3.1.0" = {
      type = "remote";
      version = "3.1.0";
      name = "cli-cursor";
      src = {
        name = "cli-cursor-3.1.0.tgz";
        url = "https://registry.npmjs.org/cli-cursor/-/cli-cursor-3.1.0.tgz";
        hash = "sha512-I/zHAwsKf9FqGoXM4WWRACob9+SNukZTd94DWF57E4toouRulbCxcUh6RKUEOQlYTHJnzkPMySvPNaaSLNfLZw==";
      };
      dependencies = {
        "restore-cursor" = "3.1.0";
      };
    };
    "cli-spinners@2.9.0" = {
      type = "remote";
      version = "2.9.0";
      name = "cli-spinners";
      src = {
        name = "cli-spinners-2.9.0.tgz";
        url = "https://registry.npmjs.org/cli-spinners/-/cli-spinners-2.9.0.tgz";
        hash = "sha512-4/aL9X3Wh0yiMQlE+eeRhWP6vclO3QRtw1JHKIT0FFUs5FjpFmESqtMvYZ0+lbzBw900b95mS0hohy+qn2VK/g==";
      };
      dependencies = {

      };
    };
    "cli-truncate@2.1.0" = {
      type = "remote";
      version = "2.1.0";
      name = "cli-truncate";
      src = {
        name = "cli-truncate-2.1.0.tgz";
        url = "https://registry.npmjs.org/cli-truncate/-/cli-truncate-2.1.0.tgz";
        hash = "sha512-n8fOixwDD6b/ObinzTrp1ZKFzbgvKZvuz/TvejnLn1aQfC6r52XEx85FmuC+3HI+JM7coBRXUvNqEU2PHVrHpg==";
      };
      dependencies = {
        "slice-ansi" = "3.0.0";
        "string-width" = "4.2.3";
      };
    };
    "cliui@7.0.4" = {
      type = "remote";
      version = "7.0.4";
      name = "cliui";
      src = {
        name = "cliui-7.0.4.tgz";
        url = "https://registry.npmjs.org/cliui/-/cliui-7.0.4.tgz";
        hash = "sha512-OcRE68cOsVMXp1Yvonl/fzkQOyjLSu/8bhPDfQt0e0/Eb283TKP20Fs2MqoPsr9SwA595rRCA+QMzYc9nBP+JQ==";
      };
      dependencies = {
        "string-width" = "4.2.3";
        "strip-ansi" = "6.0.1";
        "wrap-ansi" = "7.0.0";
      };
    };
    "code-excerpt@3.0.0" = {
      type = "remote";
      version = "3.0.0";
      name = "code-excerpt";
      src = {
        name = "code-excerpt-3.0.0.tgz";
        url = "https://registry.npmjs.org/code-excerpt/-/code-excerpt-3.0.0.tgz";
        hash = "sha512-VHNTVhd7KsLGOqfX3SyeO8RyYPMp1GJOg194VITk04WMYCv4plV68YWe6TJZxd9MhobjtpMRnVky01gqZsalaw==";
      };
      dependencies = {
        "convert-to-spaces" = "1.0.2";
      };
    };
    "color-convert@1.9.3" = {
      type = "remote";
      version = "1.9.3";
      name = "color-convert";
      src = {
        name = "color-convert-1.9.3.tgz";
        url = "https://registry.npmjs.org/color-convert/-/color-convert-1.9.3.tgz";
        hash = "sha512-QfAUtd+vFdAtFQcC8CCyYt1fYWxSqAiK2cSD6zDB8N3cpsEBAvRxp9zOGg6G/SHHJYAT88/az/IuDGALsNVbGg==";
      };
      dependencies = {
        "color-name" = "1.1.3";
      };
    };
    "color-convert@2.0.1" = {
      type = "remote";
      version = "2.0.1";
      name = "color-convert";
      src = {
        name = "color-convert-2.0.1.tgz";
        url = "https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz";
        hash = "sha512-RRECPsj7iu/xb5oKYcsFHSppFNnsj/52OVTRKb4zP5onXwVF3zVmmToNcOfGC+CRDpfK/U584fMg38ZHCaElKQ==";
      };
      dependencies = {
        "color-name" = "1.1.4";
      };
    };
    "color-name@1.1.3" = {
      type = "remote";
      version = "1.1.3";
      name = "color-name";
      src = {
        name = "color-name-1.1.3.tgz";
        url = "https://registry.npmjs.org/color-name/-/color-name-1.1.3.tgz";
        hash = "sha512-72fSenhMw2HZMTVHeCA9KCmpEIbzWiQsjN+BHcBbS9vr1mtt+vJjPdksIBNUmKAW8TFUDPJK5SUU3QhE9NEXDw==";
      };
      dependencies = {

      };
    };
    "color-name@1.1.4" = {
      type = "remote";
      version = "1.1.4";
      name = "color-name";
      src = {
        name = "color-name-1.1.4.tgz";
        url = "https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz";
        hash = "sha512-dOy+3AuW3a2wNbZHIuMZpTcgjGuLU/uBL/ubcZF9OXbDo8ff4O8yVp5Bf0efS8uEoYo5q4Fx7dY9OgQGXgAsQA==";
      };
      dependencies = {

      };
    };
    "concat-map@0.0.1" = {
      type = "remote";
      version = "0.0.1";
      name = "concat-map";
      src = {
        name = "concat-map-0.0.1.tgz";
        url = "https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz";
        hash = "sha512-/Srv4dswyQNBfohGpz9o6Yb3Gz3SrUDqBH5rTuhGR7ahtlbYKnVxw2bCFMRljaA7EXHaXZ8wsHdodFvbkhKmqg==";
      };
      dependencies = {

      };
    };
    "convert-to-spaces@1.0.2" = {
      type = "remote";
      version = "1.0.2";
      name = "convert-to-spaces";
      src = {
        name = "convert-to-spaces-1.0.2.tgz";
        url = "https://registry.npmjs.org/convert-to-spaces/-/convert-to-spaces-1.0.2.tgz";
        hash = "sha512-cj09EBuObp9gZNQCzc7hByQyrs6jVGE+o9kSJmeUoj+GiPiJvi5LYqEH/Hmme4+MTLHM+Ejtq+FChpjjEnsPdQ==";
      };
      dependencies = {

      };
    };
    "csstype@3.1.2" = {
      type = "remote";
      version = "3.1.2";
      name = "csstype";
      src = {
        name = "csstype-3.1.2.tgz";
        url = "https://registry.npmjs.org/csstype/-/csstype-3.1.2.tgz";
        hash = "sha512-I7K1Uu0MBPzaFKg4nI5Q7Vs2t+3gWWW648spaF+Rg7pI9ds18Ugn+lvg4SHczUdKlHI5LWBXyqfS8+DufyBsgQ==";
      };
      dependencies = {

      };
    };
    "emoji-regex@8.0.0" = {
      type = "remote";
      version = "8.0.0";
      name = "emoji-regex";
      src = {
        name = "emoji-regex-8.0.0.tgz";
        url = "https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz";
        hash = "sha512-MSjYzcWNOA0ewAHpz0MxpYFvwg6yjy1NG3xteoqz644VCo/RPgnr1/GGt+ic3iJTzQ8Eu3TdM14SawnVUmGE6A==";
      };
      dependencies = {

      };
    };
    "escalade@3.1.1" = {
      type = "remote";
      version = "3.1.1";
      name = "escalade";
      src = {
        name = "escalade-3.1.1.tgz";
        url = "https://registry.npmjs.org/escalade/-/escalade-3.1.1.tgz";
        hash = "sha512-k0er2gUkLf8O0zKJiAhmkTnJlTvINGv7ygDNPbeIsX/TJjGJZHuh9B2UxbsaEkmlEo9MfhrSzmhIlhRlI2GXnw==";
      };
      dependencies = {

      };
    };
    "escape-string-regexp@1.0.5" = {
      type = "remote";
      version = "1.0.5";
      name = "escape-string-regexp";
      src = {
        name = "escape-string-regexp-1.0.5.tgz";
        url = "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz";
        hash = "sha512-vbRorB5FUQWvla16U8R/qgaFIya2qGzwDrNmCZuYKrbdSUMG6I1ZCGQRefkRVhuOkIGVne7BQ35DSfo1qvJqFg==";
      };
      dependencies = {

      };
    };
    "escape-string-regexp@2.0.0" = {
      type = "remote";
      version = "2.0.0";
      name = "escape-string-regexp";
      src = {
        name = "escape-string-regexp-2.0.0.tgz";
        url = "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-2.0.0.tgz";
        hash = "sha512-UpzcLCXolUWcNu5HtVMHYdXJjArjsF9C0aNnquZYY4uW/Vu0miy5YoWvbV345HauVvcAUnpRuhMMcqTcGOY2+w==";
      };
      dependencies = {

      };
    };
    "fill-range@7.0.1" = {
      type = "remote";
      version = "7.0.1";
      name = "fill-range";
      src = {
        name = "fill-range-7.0.1.tgz";
        url = "https://registry.npmjs.org/fill-range/-/fill-range-7.0.1.tgz";
        hash = "sha512-qOo9F+dMUmC2Lcb4BbVvnKJxTPjCm+RRpe4gDuGrzkL7mEVl/djYSu2OdQ2Pa302N4oqkSg9ir6jaLWJ2USVpQ==";
      };
      dependencies = {
        "to-regex-range" = "5.0.1";
      };
    };
    "fp-ts@2.16.1" = {
      type = "remote";
      version = "2.16.1";
      name = "fp-ts";
      src = {
        name = "fp-ts-2.16.1.tgz";
        url = "https://registry.npmjs.org/fp-ts/-/fp-ts-2.16.1.tgz";
        hash = "sha512-by7U5W8dkIzcvDofUcO42yl9JbnHTEDBrzu3pt5fKT+Z4Oy85I21K80EYJYdjQGC2qum4Vo55Ag57iiIK4FYuA==";
      };
      dependencies = {

      };
    };
    "frp-ts@0.0.1" = {
      type = "remote";
      version = "0.0.1";
      name = "frp-ts";
      src = {
        name = "frp-ts-0.0.1.tgz";
        url = "https://registry.npmjs.org/frp-ts/-/frp-ts-0.0.1.tgz";
        hash = "sha512-ryNqNx/+fXUsUsWNH9uBu3tgvcnB0tZKXHk0hqDG73r8/QmOYOGU8Xp5HEptkdEiLIO7GPBZ4GOA6ypoOHQzPA==";
      };
      dependencies = {
        "fp-ts" = "2.16.1";
      };
    };
    "fs.realpath@1.0.0" = {
      type = "remote";
      version = "1.0.0";
      name = "fs.realpath";
      src = {
        name = "fs.realpath-1.0.0.tgz";
        url = "https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz";
        hash = "sha512-OO0pH2lK6a0hZnAdau5ItzHPI6pUlvI7jMVnxUQRtw4owF2wk8lOSabtGDCTP4Ggrg2MbGnWO9X8K1t4+fGMDw==";
      };
      dependencies = {

      };
    };
    "fsevents@2.3.2" = {
      type = "remote";
      version = "2.3.2";
      name = "fsevents";
      src = {
        name = "fsevents-2.3.2.tgz";
        url = "https://registry.npmjs.org/fsevents/-/fsevents-2.3.2.tgz";
        hash = "sha512-xiqMQR4xAeHTuB9uWm+fFRcIOgKBMiOBP+eXiyT7jsgVCq1bkVygt00oASowB7EdtpOHaaPgKt812P9ab+DDKA==";
      };
      dependencies = {

      };
    };
    "gbt@0.0.3" = {
      type = "remote";
      version = "0.0.3";
      name = "gbt";
      src = {
        name = "gbt-0.0.3.tgz";
        url = "https://registry.npmjs.org/gbt/-/gbt-0.0.3.tgz";
        hash = "sha512-GdD1RKAxFduubyti9PH5/SMLeHrUM8a+iekg7tgzum/IwKreefRMHtqW0Hkk6skCkOtdxkJ3w+q8ivfB9/Kljg==";
      };
      dependencies = {
        "@effect-ts/core" = "0.12.19";
        "@effect-ts/node" = "0.5.0";
        "@effect-ts/system" = "0.10.18";
        "@most/core" = "1.6.1";
        "@most/scheduler" = "1.3.0";
        "@types/chokidar" = "2.1.3";
        "@types/glob" = "7.2.0";
        "@types/gradient-string" = "1.1.2";
        "@types/ink-divider" = "2.0.2";
        "@types/ink-gradient" = "2.0.1";
        "@types/node" = "14.18.54";
        "@types/react" = "17.0.62";
        "@types/yargs" = "16.0.5";
        "chokidar" = "3.5.3";
        "fp-ts" = "2.16.1";
        "frp-ts" = "0.0.1";
        "glob" = "7.2.3";
        "gradient-string" = "1.2.0";
        "ink" = "3.2.0";
        "ink-divider" = "3.0.0";
        "ink-gradient" = "2.0.0";
        "ink-spinner" = "4.0.3";
        "ink-use-stdout-dimensions" = "1.0.5";
        "io-ts" = "2.2.20";
        "io-ts-reporters" = "1.2.2";
        "monocle-ts" = "2.3.13";
        "node-graphviz" = "0.1.1";
        "react" = "17.0.2";
        "tree-kill" = "1.2.2";
        "ts-adt" = "2.1.2";
        "yargs" = "16.2.0";
      };
    };
    "get-caller-file@2.0.5" = {
      type = "remote";
      version = "2.0.5";
      name = "get-caller-file";
      src = {
        name = "get-caller-file-2.0.5.tgz";
        url = "https://registry.npmjs.org/get-caller-file/-/get-caller-file-2.0.5.tgz";
        hash = "sha512-DyFP3BM/3YHTQOCUL/w0OZHR0lpKeGrxotcHWcqNEdnltqFwXVfhEBQ94eIo34AfQpo0rGki4cyIiftY06h2Fg==";
      };
      dependencies = {

      };
    };
    "glob-parent@5.1.2" = {
      type = "remote";
      version = "5.1.2";
      name = "glob-parent";
      src = {
        name = "glob-parent-5.1.2.tgz";
        url = "https://registry.npmjs.org/glob-parent/-/glob-parent-5.1.2.tgz";
        hash = "sha512-AOIgSQCepiJYwP3ARnGx+5VnTu2HBYdzbGP45eLw1vr3zB3vZLeyed1sC9hnbcOc9/SrMyM5RPQrkGz4aS9Zow==";
      };
      dependencies = {
        "is-glob" = "4.0.3";
      };
    };
    "glob@7.2.3" = {
      type = "remote";
      version = "7.2.3";
      name = "glob";
      src = {
        name = "glob-7.2.3.tgz";
        url = "https://registry.npmjs.org/glob/-/glob-7.2.3.tgz";
        hash = "sha512-nFR0zLpU2YCaRxwoCJvL6UvCH2JFyFVIvwTLsIf21AuHlMskA1hhTdk+LlYJtOlYt9v6dvszD2BGRqBL+iQK9Q==";
      };
      dependencies = {
        "fs.realpath" = "1.0.0";
        "inflight" = "1.0.6";
        "inherits" = "2.0.4";
        "minimatch" = "3.1.2";
        "once" = "1.4.0";
        "path-is-absolute" = "1.0.1";
      };
    };
    "gradient-string@1.2.0" = {
      type = "remote";
      version = "1.2.0";
      name = "gradient-string";
      src = {
        name = "gradient-string-1.2.0.tgz";
        url = "https://registry.npmjs.org/gradient-string/-/gradient-string-1.2.0.tgz";
        hash = "sha512-Lxog7IDMMWNjwo4O0KbdBvSewk4vW6kQe5XaLuuPCyCE65AGQ1P8YqKJa5dq8TYf/Ge31F+KjWzPR5mAJvjlAg==";
      };
      dependencies = {
        "chalk" = "2.4.2";
        "tinygradient" = "0.4.3";
      };
    };
    "has-flag@3.0.0" = {
      type = "remote";
      version = "3.0.0";
      name = "has-flag";
      src = {
        name = "has-flag-3.0.0.tgz";
        url = "https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz";
        hash = "sha512-sKJf1+ceQBr4SMkvQnBDNDtf4TXpVhVGateu0t918bl30FnbE2m4vNLX+VWe/dpjlb+HugGYzW7uQXH98HPEYw==";
      };
      dependencies = {

      };
    };
    "has-flag@4.0.0" = {
      type = "remote";
      version = "4.0.0";
      name = "has-flag";
      src = {
        name = "has-flag-4.0.0.tgz";
        url = "https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz";
        hash = "sha512-EykJT/Q1KjTWctppgIAgfSO0tKVuZUjhgMr17kqTumMl6Afv3EISleU7qZUzoXDFTAHTDC4NOoG/ZxU3EvlMPQ==";
      };
      dependencies = {

      };
    };
    "indent-string@4.0.0" = {
      type = "remote";
      version = "4.0.0";
      name = "indent-string";
      src = {
        name = "indent-string-4.0.0.tgz";
        url = "https://registry.npmjs.org/indent-string/-/indent-string-4.0.0.tgz";
        hash = "sha512-EdDDZu4A2OyIK7Lr/2zG+w5jmbuk1DVBnEwREQvBzspBJkCEbRa8GxU1lghYcaGJCnRWibjDXlq779X1/y5xwg==";
      };
      dependencies = {

      };
    };
    "inflight@1.0.6" = {
      type = "remote";
      version = "1.0.6";
      name = "inflight";
      src = {
        name = "inflight-1.0.6.tgz";
        url = "https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz";
        hash = "sha512-k92I/b08q4wvFscXCLvqfsHCrjrF7yiXsQuIVvVE7N82W3+aqpzuUdBbfhWcy/FZR3/4IgflMgKLOsvPDrGCJA==";
      };
      dependencies = {
        "once" = "1.4.0";
        "wrappy" = "1.0.2";
      };
    };
    "inherits@2.0.4" = {
      type = "remote";
      version = "2.0.4";
      name = "inherits";
      src = {
        name = "inherits-2.0.4.tgz";
        url = "https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz";
        hash = "sha512-k/vGaX4/Yla3WzyMCvTQOXYeIHvqOKtnqBduzTHpzpQZzAskKMhZ2K+EnBiSM9zGSoIFeMpXKxa4dYeZIQqewQ==";
      };
      dependencies = {

      };
    };
    "ink-divider@3.0.0" = {
      type = "remote";
      version = "3.0.0";
      name = "ink-divider";
      src = {
        name = "ink-divider-3.0.0.tgz";
        url = "https://registry.npmjs.org/ink-divider/-/ink-divider-3.0.0.tgz";
        hash = "sha512-Mqb9WArtEZCtXw622aHhJqPK157QNc+8ssl9/RvAZlS6nZRCKyW4mYOYCudQh6dSuFGt9eG5yaqT1mJaGmwu+w==";
      };
      dependencies = {
        "ink" = "3.2.0";
        "prop-types" = "15.8.1";
        "react" = "17.0.2";
        "string-width" = "4.2.3";
      };
    };
    "ink-gradient@2.0.0" = {
      type = "remote";
      version = "2.0.0";
      name = "ink-gradient";
      src = {
        name = "ink-gradient-2.0.0.tgz";
        url = "https://registry.npmjs.org/ink-gradient/-/ink-gradient-2.0.0.tgz";
        hash = "sha512-d2BK/EzzBRoDL54NWkS3JGE4J8xtzwRVWxDAIkQ/eQ60XIzrFMtT5JlUqgV05Qlt32Jvk50qW51YqxGJggTuqA==";
      };
      dependencies = {
        "gradient-string" = "1.2.0";
        "ink" = "3.2.0";
        "prop-types" = "15.8.1";
        "react" = "17.0.2";
        "strip-ansi" = "6.0.1";
      };
    };
    "ink-spinner@4.0.3" = {
      type = "remote";
      version = "4.0.3";
      name = "ink-spinner";
      src = {
        name = "ink-spinner-4.0.3.tgz";
        url = "https://registry.npmjs.org/ink-spinner/-/ink-spinner-4.0.3.tgz";
        hash = "sha512-uJ4nbH00MM9fjTJ5xdw0zzvtXMkeGb0WV6dzSWvFv2/+ks6FIhpkt+Ge/eLdh0Ah6Vjw5pLMyNfoHQpRDRVFbQ==";
      };
      dependencies = {
        "cli-spinners" = "2.9.0";
        "ink" = "3.2.0";
        "react" = "17.0.2";
      };
    };
    "ink-use-stdout-dimensions@1.0.5" = {
      type = "remote";
      version = "1.0.5";
      name = "ink-use-stdout-dimensions";
      src = {
        name = "ink-use-stdout-dimensions-1.0.5.tgz";
        url = "https://registry.npmjs.org/ink-use-stdout-dimensions/-/ink-use-stdout-dimensions-1.0.5.tgz";
        hash = "sha512-rVsqnw4tQEAJUoknU09+zHdDf30GJdkumkHr0iz/TOYMYEZJkYqziQSGJAM+Z+M603EDfO89+Nxyn/Ko2Zknfw==";
      };
      dependencies = {
        "ink" = "3.2.0";
        "react" = "17.0.2";
      };
    };
    "ink@3.2.0" = {
      type = "remote";
      version = "3.2.0";
      name = "ink";
      src = {
        name = "ink-3.2.0.tgz";
        url = "https://registry.npmjs.org/ink/-/ink-3.2.0.tgz";
        hash = "sha512-firNp1q3xxTzoItj/eOOSZQnYSlyrWks5llCTVX37nJ59K3eXbQ8PtzCguqo8YI19EELo5QxaKnJd4VxzhU8tg==";
      };
      dependencies = {
        "@types/react" = "17.0.62";
        "ansi-escapes" = "4.3.2";
        "auto-bind" = "4.0.0";
        "chalk" = "4.1.2";
        "cli-boxes" = "2.2.1";
        "cli-cursor" = "3.1.0";
        "cli-truncate" = "2.1.0";
        "code-excerpt" = "3.0.0";
        "indent-string" = "4.0.0";
        "is-ci" = "2.0.0";
        "lodash" = "4.17.21";
        "patch-console" = "1.0.0";
        "react" = "17.0.2";
        "react-devtools-core" = "4.28.0";
        "react-reconciler" = "0.26.2";
        "scheduler" = "0.20.2";
        "signal-exit" = "3.0.7";
        "slice-ansi" = "3.0.0";
        "stack-utils" = "2.0.6";
        "string-width" = "4.2.3";
        "type-fest" = "0.12.0";
        "widest-line" = "3.1.0";
        "wrap-ansi" = "6.2.0";
        "ws" = "7.5.9";
        "yoga-layout-prebuilt" = "1.10.0";
      };
    };
    "io-ts-reporters@1.2.2" = {
      type = "remote";
      version = "1.2.2";
      name = "io-ts-reporters";
      src = {
        name = "io-ts-reporters-1.2.2.tgz";
        url = "https://registry.npmjs.org/io-ts-reporters/-/io-ts-reporters-1.2.2.tgz";
        hash = "sha512-igASwWWkDY757OutNcM6zTtdJf/eTZYkoe2ymsX2qpm5bKZLo74FJYjsCtMQOEdY7dRHLLEulCyFQwdN69GBCg==";
      };
      dependencies = {
        "fp-ts" = "2.16.1";
        "io-ts" = "2.2.20";
      };
    };
    "io-ts@2.2.20" = {
      type = "remote";
      version = "2.2.20";
      name = "io-ts";
      src = {
        name = "io-ts-2.2.20.tgz";
        url = "https://registry.npmjs.org/io-ts/-/io-ts-2.2.20.tgz";
        hash = "sha512-Rq2BsYmtwS5vVttie4rqrOCIfHCS9TgpRLFpKQCM1wZBBRY9nWVGmEvm2FnDbSE2un1UE39DvFpTR5UL47YDcA==";
      };
      dependencies = {
        "fp-ts" = "2.16.1";
      };
    };
    "is-binary-path@2.1.0" = {
      type = "remote";
      version = "2.1.0";
      name = "is-binary-path";
      src = {
        name = "is-binary-path-2.1.0.tgz";
        url = "https://registry.npmjs.org/is-binary-path/-/is-binary-path-2.1.0.tgz";
        hash = "sha512-ZMERYes6pDydyuGidse7OsHxtbI7WVeUEozgR/g7rd0xUimYNlvZRE/K2MgZTjWy725IfelLeVcEM97mmtRGXw==";
      };
      dependencies = {
        "binary-extensions" = "2.2.0";
      };
    };
    "is-ci@2.0.0" = {
      type = "remote";
      version = "2.0.0";
      name = "is-ci";
      src = {
        name = "is-ci-2.0.0.tgz";
        url = "https://registry.npmjs.org/is-ci/-/is-ci-2.0.0.tgz";
        hash = "sha512-YfJT7rkpQB0updsdHLGWrvhBJfcfzNNawYDNIyQXJz0IViGf75O8EBPKSdvw2rF+LGCsX4FZ8tcr3b19LcZq4w==";
      };
      dependencies = {
        "ci-info" = "2.0.0";
      };
    };
    "is-extglob@2.1.1" = {
      type = "remote";
      version = "2.1.1";
      name = "is-extglob";
      src = {
        name = "is-extglob-2.1.1.tgz";
        url = "https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz";
        hash = "sha512-SbKbANkN603Vi4jEZv49LeVJMn4yGwsbzZworEoyEiutsN3nJYdbO36zfhGJ6QEDpOZIFkDtnq5JRxmvl3jsoQ==";
      };
      dependencies = {

      };
    };
    "is-fullwidth-code-point@3.0.0" = {
      type = "remote";
      version = "3.0.0";
      name = "is-fullwidth-code-point";
      src = {
        name = "is-fullwidth-code-point-3.0.0.tgz";
        url = "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz";
        hash = "sha512-zymm5+u+sCsSWyD9qNaejV3DFvhCKclKdizYaJUuHA83RLjb7nSuGnddCHGv0hk+KY7BMAlsWeK4Ueg6EV6XQg==";
      };
      dependencies = {

      };
    };
    "is-glob@4.0.3" = {
      type = "remote";
      version = "4.0.3";
      name = "is-glob";
      src = {
        name = "is-glob-4.0.3.tgz";
        url = "https://registry.npmjs.org/is-glob/-/is-glob-4.0.3.tgz";
        hash = "sha512-xelSayHH36ZgE7ZWhli7pW34hNbNl8Ojv5KVmkJD4hBdD3th8Tfk9vYasLM+mXWOZhFkgZfxhLSnrwRr4elSSg==";
      };
      dependencies = {
        "is-extglob" = "2.1.1";
      };
    };
    "is-number@7.0.0" = {
      type = "remote";
      version = "7.0.0";
      name = "is-number";
      src = {
        name = "is-number-7.0.0.tgz";
        url = "https://registry.npmjs.org/is-number/-/is-number-7.0.0.tgz";
        hash = "sha512-41Cifkg6e8TylSpdtTpeLVMqvSBEVzTttHvERD741+pnZ8ANv0004MRL43QKPDlK9cGvNp6NZWZUBlbGXYxxng==";
      };
      dependencies = {

      };
    };
    "js-tokens@4.0.0" = {
      type = "remote";
      version = "4.0.0";
      name = "js-tokens";
      src = {
        name = "js-tokens-4.0.0.tgz";
        url = "https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz";
        hash = "sha512-RdJUflcE3cUzKiMqQgsCu06FPu9UdIJO0beYbPhHN4k6apgJtifcoCtT9bcxOpYBtpD2kCM6Sbzg4CausW/PKQ==";
      };
      dependencies = {

      };
    };
    "left-pad@1.3.0" = {
      type = "remote";
      version = "1.3.0";
      name = "left-pad";
      src = {
        name = "left-pad-1.3.0.tgz";
        url = "https://registry.npmjs.org/left-pad/-/left-pad-1.3.0.tgz";
        hash = "sha512-XI5MPzVNApjAyhQzphX8BkmKsKUxD4LdyK24iZeQGinBN9yTQT3bFlCBy/aVx2HrNcqQGsdot8ghrjyrvMCoEA==";
      };
      dependencies = {

      };
    };
    "lodash@4.17.21" = {
      type = "remote";
      version = "4.17.21";
      name = "lodash";
      src = {
        name = "lodash-4.17.21.tgz";
        url = "https://registry.npmjs.org/lodash/-/lodash-4.17.21.tgz";
        hash = "sha512-v2kDEe57lecTulaDIuNTPy3Ry4gLGJ6Z1O3vE1krgXZNrsQ+LFTGHVxVjcXPs17LhbZVGedAJv8XZ1tvj5FvSg==";
      };
      dependencies = {

      };
    };
    "loose-envify@1.4.0" = {
      type = "remote";
      version = "1.4.0";
      name = "loose-envify";
      src = {
        name = "loose-envify-1.4.0.tgz";
        url = "https://registry.npmjs.org/loose-envify/-/loose-envify-1.4.0.tgz";
        hash = "sha512-lyuxPGr/Wfhrlem2CL/UcnUc1zcqKAImBDzukY7Y5F/yQiNdko6+fRLevlw1HgMySw7f611UIY408EtxRSoK3Q==";
      };
      dependencies = {
        "js-tokens" = "4.0.0";
      };
    };
    "mimic-fn@2.1.0" = {
      type = "remote";
      version = "2.1.0";
      name = "mimic-fn";
      src = {
        name = "mimic-fn-2.1.0.tgz";
        url = "https://registry.npmjs.org/mimic-fn/-/mimic-fn-2.1.0.tgz";
        hash = "sha512-OqbOk5oEQeAZ8WXWydlu9HJjz9WVdEIvamMCcXmuqUYjTknH/sqsWvhQ3vgwKFRR1HpjvNBKQ37nbJgYzGqGcg==";
      };
      dependencies = {

      };
    };
    "minimatch@3.1.2" = {
      type = "remote";
      version = "3.1.2";
      name = "minimatch";
      src = {
        name = "minimatch-3.1.2.tgz";
        url = "https://registry.npmjs.org/minimatch/-/minimatch-3.1.2.tgz";
        hash = "sha512-J7p63hRiAjw1NDEww1W7i37+ByIrOWO5XQQAzZ3VOcL0PNybwpfmV/N05zFAzwQ9USyEcX6t3UO+K5aqBQOIHw==";
      };
      dependencies = {
        "brace-expansion" = "1.1.11";
      };
    };
    "monocle-ts@2.3.13" = {
      type = "remote";
      version = "2.3.13";
      name = "monocle-ts";
      src = {
        name = "monocle-ts-2.3.13.tgz";
        url = "https://registry.npmjs.org/monocle-ts/-/monocle-ts-2.3.13.tgz";
        hash = "sha512-D5Ygd3oulEoAm3KuGO0eeJIrhFf1jlQIoEVV2DYsZUMz42j4tGxgct97Aq68+F8w4w4geEnwFa8HayTS/7lpKQ==";
      };
      dependencies = {
        "fp-ts" = "2.16.1";
      };
    };
    "node-graphviz@0.1.1" = {
      type = "remote";
      version = "0.1.1";
      name = "node-graphviz";
      src = {
        name = "node-graphviz-0.1.1.tgz";
        url = "https://registry.npmjs.org/node-graphviz/-/node-graphviz-0.1.1.tgz";
        hash = "sha512-riY8/pFGSD1ipmyzqCwuN2M6W02ELfuLDjhJvTrQCUS/15tyU8ExkC96mlQrNLBK8Ws0z8PdH+ChBT6DuPFWWA==";
      };
      dependencies = {

      };
    };
    "normalize-path@3.0.0" = {
      type = "remote";
      version = "3.0.0";
      name = "normalize-path";
      src = {
        name = "normalize-path-3.0.0.tgz";
        url = "https://registry.npmjs.org/normalize-path/-/normalize-path-3.0.0.tgz";
        hash = "sha512-6eZs5Ls3WtCisHWp9S2GUy8dqkpGi4BVSz3GaqiE6ezub0512ESztXUwUB6C6IKbQkY2Pnb/mD4WYojCRwcwLA==";
      };
      dependencies = {

      };
    };
    "object-assign@4.1.1" = {
      type = "remote";
      version = "4.1.1";
      name = "object-assign";
      src = {
        name = "object-assign-4.1.1.tgz";
        url = "https://registry.npmjs.org/object-assign/-/object-assign-4.1.1.tgz";
        hash = "sha512-rJgTQnkUnH1sFw8yT6VSU3zD3sWmu6sZhIseY8VX+GRu3P6F7Fu+JNDoXfklElbLJSnc3FUQHVe4cU5hj+BcUg==";
      };
      dependencies = {

      };
    };
    "once@1.4.0" = {
      type = "remote";
      version = "1.4.0";
      name = "once";
      src = {
        name = "once-1.4.0.tgz";
        url = "https://registry.npmjs.org/once/-/once-1.4.0.tgz";
        hash = "sha512-lNaJgI+2Q5URQBkccEKHTQOPaXdUxnZZElQTZY0MFUAuaEqe1E+Nyvgdz/aIyNi6Z9MzO5dv1H8n58/GELp3+w==";
      };
      dependencies = {
        "wrappy" = "1.0.2";
      };
    };
    "onetime@5.1.2" = {
      type = "remote";
      version = "5.1.2";
      name = "onetime";
      src = {
        name = "onetime-5.1.2.tgz";
        url = "https://registry.npmjs.org/onetime/-/onetime-5.1.2.tgz";
        hash = "sha512-kbpaSSGJTWdAY5KPVeMOKXSrPtr8C8C7wodJbcsd51jRnmD+GZu8Y0VoU6Dm5Z4vWr0Ig/1NKuWRKf7j5aaYSg==";
      };
      dependencies = {
        "mimic-fn" = "2.1.0";
      };
    };
    "patch-console@1.0.0" = {
      type = "remote";
      version = "1.0.0";
      name = "patch-console";
      src = {
        name = "patch-console-1.0.0.tgz";
        url = "https://registry.npmjs.org/patch-console/-/patch-console-1.0.0.tgz";
        hash = "sha512-nxl9nrnLQmh64iTzMfyylSlRozL7kAXIaxw1fVcLYdyhNkJCRUzirRZTikXGJsg+hc4fqpneTK6iU2H1Q8THSA==";
      };
      dependencies = {

      };
    };
    "path-is-absolute@1.0.1" = {
      type = "remote";
      version = "1.0.1";
      name = "path-is-absolute";
      src = {
        name = "path-is-absolute-1.0.1.tgz";
        url = "https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz";
        hash = "sha512-AVbw3UJ2e9bq64vSaS9Am0fje1Pa8pbGqTTsmXfaIiMpnr5DlDhfJOuLj9Sf95ZPVDAUerDfEk88MPmPe7UCQg==";
      };
      dependencies = {

      };
    };
    "picomatch@2.3.1" = {
      type = "remote";
      version = "2.3.1";
      name = "picomatch";
      src = {
        name = "picomatch-2.3.1.tgz";
        url = "https://registry.npmjs.org/picomatch/-/picomatch-2.3.1.tgz";
        hash = "sha512-JU3teHTNjmE2VCGFzuY8EXzCDVwEqB2a8fsIvwaStHhAWJEeVd1o1QD80CU6+ZdEXXSLbSsuLwJjkCBWqRQUVA==";
      };
      dependencies = {

      };
    };
    "prop-types@15.8.1" = {
      type = "remote";
      version = "15.8.1";
      name = "prop-types";
      src = {
        name = "prop-types-15.8.1.tgz";
        url = "https://registry.npmjs.org/prop-types/-/prop-types-15.8.1.tgz";
        hash = "sha512-oj87CgZICdulUohogVAR7AjlC0327U4el4L6eAvOqCeudMDVU0NThNaV+b9Df4dXgSP1gXMTnPdhfe/2qDH5cg==";
      };
      dependencies = {
        "loose-envify" = "1.4.0";
        "object-assign" = "4.1.1";
        "react-is" = "16.13.1";
      };
    };
    "react-devtools-core@4.28.0" = {
      type = "remote";
      version = "4.28.0";
      name = "react-devtools-core";
      src = {
        name = "react-devtools-core-4.28.0.tgz";
        url = "https://registry.npmjs.org/react-devtools-core/-/react-devtools-core-4.28.0.tgz";
        hash = "sha512-E3C3X1skWBdBzwpOUbmXG8SgH6BtsluSMe+s6rRcujNKG1DGi8uIfhdhszkgDpAsMoE55hwqRUzeXCmETDBpTg==";
      };
      dependencies = {
        "shell-quote" = "1.8.1";
        "ws" = "7.5.9";
      };
    };
    "react-is@16.13.1" = {
      type = "remote";
      version = "16.13.1";
      name = "react-is";
      src = {
        name = "react-is-16.13.1.tgz";
        url = "https://registry.npmjs.org/react-is/-/react-is-16.13.1.tgz";
        hash = "sha512-24e6ynE2H+OKt4kqsOvNd8kBpV65zoxbA4BVsEOB3ARVWQki/DHzaUoC5KuON/BiccDaCCTZBuOcfZs70kR8bQ==";
      };
      dependencies = {

      };
    };
    "react-reconciler@0.26.2" = {
      type = "remote";
      version = "0.26.2";
      name = "react-reconciler";
      src = {
        name = "react-reconciler-0.26.2.tgz";
        url = "https://registry.npmjs.org/react-reconciler/-/react-reconciler-0.26.2.tgz";
        hash = "sha512-nK6kgY28HwrMNwDnMui3dvm3rCFjZrcGiuwLc5COUipBK5hWHLOxMJhSnSomirqWwjPBJKV1QcbkI0VJr7Gl1Q==";
      };
      dependencies = {
        "loose-envify" = "1.4.0";
        "object-assign" = "4.1.1";
        "react" = "17.0.2";
        "scheduler" = "0.20.2";
      };
    };
    "react@17.0.2" = {
      type = "remote";
      version = "17.0.2";
      name = "react";
      src = {
        name = "react-17.0.2.tgz";
        url = "https://registry.npmjs.org/react/-/react-17.0.2.tgz";
        hash = "sha512-gnhPt75i/dq/z3/6q/0asP78D0u592D5L1pd7M8P+dck6Fu/jJeL6iVVK23fptSUZj8Vjf++7wXA8UNclGQcbA==";
      };
      dependencies = {
        "loose-envify" = "1.4.0";
        "object-assign" = "4.1.1";
      };
    };
    "readdirp@3.6.0" = {
      type = "remote";
      version = "3.6.0";
      name = "readdirp";
      src = {
        name = "readdirp-3.6.0.tgz";
        url = "https://registry.npmjs.org/readdirp/-/readdirp-3.6.0.tgz";
        hash = "sha512-hOS089on8RduqdbhvQ5Z37A0ESjsqz6qnRcffsMU3495FuTdqSm+7bhJ29JvIOsBDEEnan5DPu9t3To9VRlMzA==";
      };
      dependencies = {
        "picomatch" = "2.3.1";
      };
    };
    "require-directory@2.1.1" = {
      type = "remote";
      version = "2.1.1";
      name = "require-directory";
      src = {
        name = "require-directory-2.1.1.tgz";
        url = "https://registry.npmjs.org/require-directory/-/require-directory-2.1.1.tgz";
        hash = "sha512-fGxEI7+wsG9xrvdjsrlmL22OMTTiHRwAMroiEeMgq8gzoLC/PQr7RsRDSTLUg/bZAZtF+TVIkHc6/4RIKrui+Q==";
      };
      dependencies = {

      };
    };
    "restore-cursor@3.1.0" = {
      type = "remote";
      version = "3.1.0";
      name = "restore-cursor";
      src = {
        name = "restore-cursor-3.1.0.tgz";
        url = "https://registry.npmjs.org/restore-cursor/-/restore-cursor-3.1.0.tgz";
        hash = "sha512-l+sSefzHpj5qimhFSE5a8nufZYAM3sBSVMAPtYkmC+4EH2anSGaEMXSD0izRQbu9nfyQ9y5JrVmp7E8oZrUjvA==";
      };
      dependencies = {
        "onetime" = "5.1.2";
        "signal-exit" = "3.0.7";
      };
    };
    "scheduler@0.20.2" = {
      type = "remote";
      version = "0.20.2";
      name = "scheduler";
      src = {
        name = "scheduler-0.20.2.tgz";
        url = "https://registry.npmjs.org/scheduler/-/scheduler-0.20.2.tgz";
        hash = "sha512-2eWfGgAqqWFGqtdMmcL5zCMK1U8KlXv8SQFGglL3CEtd0aDVDWgeF/YoCmvln55m5zSk3J/20hTaSBeSObsQDQ==";
      };
      dependencies = {
        "loose-envify" = "1.4.0";
        "object-assign" = "4.1.1";
      };
    };
    "shell-quote@1.8.1" = {
      type = "remote";
      version = "1.8.1";
      name = "shell-quote";
      src = {
        name = "shell-quote-1.8.1.tgz";
        url = "https://registry.npmjs.org/shell-quote/-/shell-quote-1.8.1.tgz";
        hash = "sha512-6j1W9l1iAs/4xYBI1SYOVZyFcCis9b4KCLQ8fgAGG07QvzaRLVVRQvAy85yNmmZSjYjg4MWh4gNvlPujU/5LpA==";
      };
      dependencies = {

      };
    };
    "signal-exit@3.0.7" = {
      type = "remote";
      version = "3.0.7";
      name = "signal-exit";
      src = {
        name = "signal-exit-3.0.7.tgz";
        url = "https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.7.tgz";
        hash = "sha512-wnD2ZE+l+SPC/uoS0vXeE9L1+0wuaMqKlfz9AMUo38JsyLSBWSFcHR1Rri62LZc12vLr1gb3jl7iwQhgwpAbGQ==";
      };
      dependencies = {

      };
    };
    "slice-ansi@3.0.0" = {
      type = "remote";
      version = "3.0.0";
      name = "slice-ansi";
      src = {
        name = "slice-ansi-3.0.0.tgz";
        url = "https://registry.npmjs.org/slice-ansi/-/slice-ansi-3.0.0.tgz";
        hash = "sha512-pSyv7bSTC7ig9Dcgbw9AuRNUb5k5V6oDudjZoMBSr13qpLBG7tB+zgCkARjq7xIUgdz5P1Qe8u+rSGdouOOIyQ==";
      };
      dependencies = {
        "ansi-styles" = "4.3.0";
        "astral-regex" = "2.0.0";
        "is-fullwidth-code-point" = "3.0.0";
      };
    };
    "stack-utils@2.0.6" = {
      type = "remote";
      version = "2.0.6";
      name = "stack-utils";
      src = {
        name = "stack-utils-2.0.6.tgz";
        url = "https://registry.npmjs.org/stack-utils/-/stack-utils-2.0.6.tgz";
        hash = "sha512-XlkWvfIm6RmsWtNJx+uqtKLS8eqFbxUg0ZzLXqY0caEy9l7hruX8IpiDnjsLavoBgqCCR71TqWO8MaXYheJ3RQ==";
      };
      dependencies = {
        "escape-string-regexp" = "2.0.0";
      };
    };
    "string-width@4.2.3" = {
      type = "remote";
      version = "4.2.3";
      name = "string-width";
      src = {
        name = "string-width-4.2.3.tgz";
        url = "https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz";
        hash = "sha512-wKyQRQpjJ0sIp62ErSZdGsjMJWsap5oRNihHhu6G7JVO/9jIB6UyevL+tXuOqrng8j/cxKTWyWUwvSTriiZz/g==";
      };
      dependencies = {
        "emoji-regex" = "8.0.0";
        "is-fullwidth-code-point" = "3.0.0";
        "strip-ansi" = "6.0.1";
      };
    };
    "strip-ansi@6.0.1" = {
      type = "remote";
      version = "6.0.1";
      name = "strip-ansi";
      src = {
        name = "strip-ansi-6.0.1.tgz";
        url = "https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz";
        hash = "sha512-Y38VPSHcqkFrCpFnQ9vuSXmquuv5oXOKpGeT6aGrr3o3Gc9AlVa6JBfUSOCnbxGGZF+/0ooI7KrPuUSztUdU5A==";
      };
      dependencies = {
        "ansi-regex" = "5.0.1";
      };
    };
    "supports-color@5.5.0" = {
      type = "remote";
      version = "5.5.0";
      name = "supports-color";
      src = {
        name = "supports-color-5.5.0.tgz";
        url = "https://registry.npmjs.org/supports-color/-/supports-color-5.5.0.tgz";
        hash = "sha512-QjVjwdXIt408MIiAqCX4oUKsgU2EqAGzs2Ppkm4aQYbjm+ZEWEcW4SfFNTr4uMNZma0ey4f5lgLrkB0aX0QMow==";
      };
      dependencies = {
        "has-flag" = "3.0.0";
      };
    };
    "supports-color@7.2.0" = {
      type = "remote";
      version = "7.2.0";
      name = "supports-color";
      src = {
        name = "supports-color-7.2.0.tgz";
        url = "https://registry.npmjs.org/supports-color/-/supports-color-7.2.0.tgz";
        hash = "sha512-qpCAvRl9stuOHveKsn7HncJRvv501qIacKzQlO/+Lwxc9+0q2wLyv4Dfvt80/DPn2pqOBsJdDiogXGR9+OvwRw==";
      };
      dependencies = {
        "has-flag" = "4.0.0";
      };
    };
    "tinycolor2@1.6.0" = {
      type = "remote";
      version = "1.6.0";
      name = "tinycolor2";
      src = {
        name = "tinycolor2-1.6.0.tgz";
        url = "https://registry.npmjs.org/tinycolor2/-/tinycolor2-1.6.0.tgz";
        hash = "sha512-XPaBkWQJdsf3pLKJV9p4qN/S+fm2Oj8AIPo1BTUhg5oxkvm9+SVEGFdhyOz7tTdUTfvxMiAs4sp6/eZO2Ew+pw==";
      };
      dependencies = {

      };
    };
    "tinygradient@0.4.3" = {
      type = "remote";
      version = "0.4.3";
      name = "tinygradient";
      src = {
        name = "tinygradient-0.4.3.tgz";
        url = "https://registry.npmjs.org/tinygradient/-/tinygradient-0.4.3.tgz";
        hash = "sha512-tBPYQSs6eWukzzAITBSmqcOwZCKACvRa/XjPPh1mj4mnx4G3Drm51HxyCTU/TKnY8kG4hmTe5QlOh9O82aNtJQ==";
      };
      dependencies = {
        "@types/tinycolor2" = "1.4.3";
        "tinycolor2" = "1.6.0";
      };
    };
    "to-regex-range@5.0.1" = {
      type = "remote";
      version = "5.0.1";
      name = "to-regex-range";
      src = {
        name = "to-regex-range-5.0.1.tgz";
        url = "https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz";
        hash = "sha512-65P7iz6X5yEr1cwcgvQxbbIw7Uk3gOy5dIdtZ4rDveLqhrdJP+Li/Hx6tyK0NEb+2GCyneCMJiGqrADCSNk8sQ==";
      };
      dependencies = {
        "is-number" = "7.0.0";
      };
    };
    "tree-kill@1.2.2" = {
      type = "remote";
      version = "1.2.2";
      name = "tree-kill";
      src = {
        name = "tree-kill-1.2.2.tgz";
        url = "https://registry.npmjs.org/tree-kill/-/tree-kill-1.2.2.tgz";
        hash = "sha512-L0Orpi8qGpRG//Nd+H90vFB+3iHnue1zSSGmNOOCh1GLJ7rUKVwV2HvijphGQS2UmhUZewS9VgvxYIdgr+fG1A==";
      };
      dependencies = {

      };
    };
    "ts-adt@2.1.2" = {
      type = "remote";
      version = "2.1.2";
      name = "ts-adt";
      src = {
        name = "ts-adt-2.1.2.tgz";
        url = "https://registry.npmjs.org/ts-adt/-/ts-adt-2.1.2.tgz";
        hash = "sha512-UD0lr7eyiBjxogQjb1xMCjF7skrnxGZLNm4iROeU3ky5tJzXN0yQkkS4DfNGfM4RaUGMhgyrzf2wUynqK8AdWQ==";
      };
      dependencies = {

      };
    };
    "type-fest@0.12.0" = {
      type = "remote";
      version = "0.12.0";
      name = "type-fest";
      src = {
        name = "type-fest-0.12.0.tgz";
        url = "https://registry.npmjs.org/type-fest/-/type-fest-0.12.0.tgz";
        hash = "sha512-53RyidyjvkGpnWPMF9bQgFtWp+Sl8O2Rp13VavmJgfAP9WWG6q6TkrKU8iyJdnwnfgHI6k2hTlgqH4aSdjoTbg==";
      };
      dependencies = {

      };
    };
    "type-fest@0.21.3" = {
      type = "remote";
      version = "0.21.3";
      name = "type-fest";
      src = {
        name = "type-fest-0.21.3.tgz";
        url = "https://registry.npmjs.org/type-fest/-/type-fest-0.21.3.tgz";
        hash = "sha512-t0rzBq87m3fVcduHDUFhKmyyX+9eo6WQjZvf51Ea/M0Q7+T374Jp1aUiyUl0GKxp8M/OETVHSDvmkyPgvX+X2w==";
      };
      dependencies = {

      };
    };
    "typescript@5.1.6" = {
      type = "remote";
      version = "5.1.6";
      name = "typescript";
      src = {
        name = "typescript-5.1.6.tgz";
        url = "https://registry.npmjs.org/typescript/-/typescript-5.1.6.tgz";
        hash = "sha512-zaWCozRZ6DLEWAWFrVDz1H6FVXzUSfTy5FUMWsQlU8Ym5JP9eO4xkTIROFCQvhQf61z6O/G6ugw3SgAnvvm+HA==";
      };
      dependencies = {

      };
    };
    "widest-line@3.1.0" = {
      type = "remote";
      version = "3.1.0";
      name = "widest-line";
      src = {
        name = "widest-line-3.1.0.tgz";
        url = "https://registry.npmjs.org/widest-line/-/widest-line-3.1.0.tgz";
        hash = "sha512-NsmoXalsWVDMGupxZ5R08ka9flZjjiLvHVAWYOKtiKM8ujtZWr9cRffak+uSE48+Ob8ObalXpwyeUiyDD6QFgg==";
      };
      dependencies = {
        "string-width" = "4.2.3";
      };
    };
    "wrap-ansi@6.2.0" = {
      type = "remote";
      version = "6.2.0";
      name = "wrap-ansi";
      src = {
        name = "wrap-ansi-6.2.0.tgz";
        url = "https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-6.2.0.tgz";
        hash = "sha512-r6lPcBGxZXlIcymEu7InxDMhdW0KDxpLgoFLcguasxCaJ/SOIZwINatK9KY/tf+ZrlywOKU0UDj3ATXUBfxJXA==";
      };
      dependencies = {
        "ansi-styles" = "4.3.0";
        "string-width" = "4.2.3";
        "strip-ansi" = "6.0.1";
      };
    };
    "wrap-ansi@7.0.0" = {
      type = "remote";
      version = "7.0.0";
      name = "wrap-ansi";
      src = {
        name = "wrap-ansi-7.0.0.tgz";
        url = "https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-7.0.0.tgz";
        hash = "sha512-YVGIj2kamLSTxw6NsZjoBxfSwsn0ycdesmc4p+Q21c5zPuZ1pl+NfxVdxPtdHvmNVOQ6XSYG4AUtyt/Fi7D16Q==";
      };
      dependencies = {
        "ansi-styles" = "4.3.0";
        "string-width" = "4.2.3";
        "strip-ansi" = "6.0.1";
      };
    };
    "wrappy@1.0.2" = {
      type = "remote";
      version = "1.0.2";
      name = "wrappy";
      src = {
        name = "wrappy-1.0.2.tgz";
        url = "https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz";
        hash = "sha512-l4Sp/DRseor9wL6EvV2+TuQn63dMkPjZ/sp9XkghTEbV9KlPS1xUsZ3u7/IQO4wxtcFB4bgpQPRcR3QCvezPcQ==";
      };
      dependencies = {

      };
    };
    "ws@7.5.9" = {
      type = "remote";
      version = "7.5.9";
      name = "ws";
      src = {
        name = "ws-7.5.9.tgz";
        url = "https://registry.npmjs.org/ws/-/ws-7.5.9.tgz";
        hash = "sha512-F+P9Jil7UiSKSkppIiD94dN07AwvFixvLIj1Og1Rl9GGMuNipJnV9JzjD6XuqmAeiswGvUmNLjr5cFuXwNS77Q==";
      };
      dependencies = {

      };
    };
    "y18n@5.0.8" = {
      type = "remote";
      version = "5.0.8";
      name = "y18n";
      src = {
        name = "y18n-5.0.8.tgz";
        url = "https://registry.npmjs.org/y18n/-/y18n-5.0.8.tgz";
        hash = "sha512-0pfFzegeDWJHJIAmTLRP2DwHjdF5s7jo9tuztdQxAhINCdvS+3nGINqPd00AphqJR/0LhANUS6/+7SCb98YOfA==";
      };
      dependencies = {

      };
    };
    "yargs-parser@20.2.9" = {
      type = "remote";
      version = "20.2.9";
      name = "yargs-parser";
      src = {
        name = "yargs-parser-20.2.9.tgz";
        url = "https://registry.npmjs.org/yargs-parser/-/yargs-parser-20.2.9.tgz";
        hash = "sha512-y11nGElTIV+CT3Zv9t7VKl+Q3hTQoT9a1Qzezhhl6Rp21gJ/IVTW7Z3y9EWXhuUBC2Shnf+DX0antecpAwSP8w==";
      };
      dependencies = {

      };
    };
    "yargs@16.2.0" = {
      type = "remote";
      version = "16.2.0";
      name = "yargs";
      src = {
        name = "yargs-16.2.0.tgz";
        url = "https://registry.npmjs.org/yargs/-/yargs-16.2.0.tgz";
        hash = "sha512-D1mvvtDG0L5ft/jGWkLpG1+m0eQxOfaBvTNELraWj22wSVUMWxZUvYgJYcKh6jGGIkJFhH4IZPQhR4TKpc8mBw==";
      };
      dependencies = {
        "cliui" = "7.0.4";
        "escalade" = "3.1.1";
        "get-caller-file" = "2.0.5";
        "require-directory" = "2.1.1";
        "string-width" = "4.2.3";
        "y18n" = "5.0.8";
        "yargs-parser" = "20.2.9";
      };
    };
    "yoga-layout-prebuilt@1.10.0" = {
      type = "remote";
      version = "1.10.0";
      name = "yoga-layout-prebuilt";
      src = {
        name = "yoga-layout-prebuilt-1.10.0.tgz";
        url = "https://registry.npmjs.org/yoga-layout-prebuilt/-/yoga-layout-prebuilt-1.10.0.tgz";
        hash = "sha512-YnOmtSbv4MTf7RGJMK0FvZ+KD8OEe/J5BNnR0GHhD8J/XcG/Qvxgszm0Un6FTHWW4uHlTgP0IztiXQnGyIR45g==";
      };
      dependencies = {
        "@types/yoga-layout" = "1.9.2";
      };
    };
    "is-positive@3.1.0" = {
      type = "remote";
      version = "3.1.0";
      name = "is-positive";
      src = {
        name = "is-positive-3.1.0.tgz";
        url = "https://codeload.github.com/kevva/is-positive/tar.gz/97edff6f525f192a3f83cea1944765f769ae2678";
        hash = "sha512-ImoN9vdC+9CSDxbHJIcYwImhox3/lvLNqKpX5dNXT9O5Vawb+c4wddQ6KXq8FsFMm4WuSc3nxaWG2Q3iBRcFdA==";
      };
      dependencies = {

      };
    };
  };
}