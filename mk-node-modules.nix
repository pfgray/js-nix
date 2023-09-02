{lib, stdenv, fetchurl, nodejs, jq}:

let

  packageStr = pkg: "${pkg.name}@${pkg.version}";

  removeLastPathSegment = str: 
    let
      parts = lib.splitString "/" str;
    in builtins.concatStringsSep "/" (lib.lists.take ((builtins.length parts) - 1) parts);

  hasScript = scriptName: "test \"$(${jq}/bin/jq -e -r '.scripts | .${scriptName} | length' < package.json)\" -gt 0";

  substringFrom = from: str: builtins.substring from (builtins.stringLength str) str;
  removeFirstAtSign = str: if lib.strings.hasPrefix "@" str then substringFrom 1 str else str;
  derivationName = pkg: "${removeFirstAtSign pkg.name}_${pkg.version}";

  mkNodeModules = context: pkg:
    let
      deps = pkg.dependencies;
    in lib.debug.traceVal deps;

in mkNodeModules