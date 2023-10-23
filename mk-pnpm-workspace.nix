{lib, stdenv, fetchurl, nodejs, jq, nodePackages}:

# custom store path env variable: NPM_CONFIG_STORE_DIR

  # "is-positive": "github:kevva/is-positive#97edff6f525f192a3f83cea1944765f769ae2678",
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

  applyModuleOverrides = overrides: modules:
    let
      applyOverride = moduleName: module:
        if builtins.hasAttr moduleName overrides
        then
          overrides.${moduleName} module
        else module;
    in
      builtins.mapAttrs applyOverride modules;

  mkPkgset = modules: overrideModules:
    let
      packagesMetadata = builtins.mapAttrs (type: applyModuleOverrides overrideModules) (import modules);
      fixedRemoteMetadata = builtins.mapAttrs (name: r: (r // {
        src = fetchurl {
          inherit (r.src) name url hash;
        };
      })) packagesMetadata.remote;
      pkgset = packagesMetadata.local // fixedRemoteMetadata;
    in pkgset;
  
  scriptLines = builtins.concatStringsSep ("\n");

  pkgIsType = type: pkg: pkg.type == type;

  mkWorkspace = {
    modules,
    overrideModules ? {},
  }:
    let
      pkgset = mkPkgset modules overrideModules;

      localPackages = lib.attrsets.filterAttrs (n: pkgIsType "local") pkgset;
      remotePackages = lib.attrsets.filterAttrs (n: pkgIsType "remote") pkgset;

      pnpmStore = stdenv.mkDerivation {
        name = "pnpm-modules";
        dontUnpack = true;
        buildInputs = [
          nodePackages.pnpm
          nodejs
        ];
        buildPhase = ''
          echo "setting pnpm store path to $out"
          mkdir -p $out
          export NPM_CONFIG_STORE_DIR=$out
          echo "pnpm store path is:"
          pnpm store path

          ${scriptLines (
              builtins.map
                (remoteDep: ''
                  echo "building ${remoteDep.name} now:"
                  # mkdir -p $PWD/${remoteDep.name}
                  # tar -xvzf ${remoteDep.src} -C $PWD/${remoteDep.name}

                  pnpm store add ${remoteDep.src}
                '')
                (builtins.attrValues remotePackages)
            )}
        '';
      };
    
    in {
      pnpmStore = pnpmStore;
    };

in mkWorkspace