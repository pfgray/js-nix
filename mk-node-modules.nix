{lib, stdenv, fetchurl, nodejs, jq, nodePackages}:

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

  mkWorkspace = {
    modules,
    overrideModules ? {},
  }: 
    let
      pkgset = mkPkgset modules overrideModules;

      findPkgByNameAndVersion = parentPkg: name: version: (
        lib.findFirst
          (pkg: pkg.name == name && pkg.version == version)
          (throw "Package ${name}@${version} (a dependency of ${packageStr parentPkg}) wasn't found in the resolved package set. Do you need to re-run js-nix?")
          (builtins.attrValues pkgset)
      );

      localPackages = lib.attrsets.filterAttrs (n: pkgIsType "local") pkgset;

      pkgIsType = type: pkg: pkg.type == type;

      mkNodeModules = context: pkg:
        let
          # remote deps are deps from npm registry (not in the workspace)
          # local deps are deps from the workspace
          deps = builtins.attrValues (builtins.mapAttrs (findPkgByNameAndVersion pkg) pkg.dependencies);
          remoteDeps = builtins.filter (pkgIsType "remote") deps;
          localDeps = builtins.filter (pkgIsType "local") deps;
        in stdenv.mkDerivation {
          name = derivationName pkg;
          dontUnpack = true;
          buildInputs = [
            #nodePackages.pnpm
            nodejs
          ];
          buildPhase = ''
            mkdir -p $out

            # for each remote dep, copy it into $out
            echo "building now: $out"
            ${scriptLines (builtins.map (remoteDep: ''
              echo "building ${remoteDep.name} now: $out/${remoteDep.name}"
              mkdir -p $PWD/${remoteDep.name}
              tar -xvzf ${remoteDep.src} -C $PWD/${remoteDep.name}
              mkdir -p $out/${remoteDep.name}
              echo "copying from $PWD/${remoteDep.name}/package to $out/${remoteDep.name}"
              cp -R $PWD/${remoteDep.name}/package/ $out/${remoteDep.name}/
            '') (builtins.trace (builtins.typeOf remoteDeps) remoteDeps))}

            # for each local dep, build it, then copy it into $out

            # for each dep,
            #   cd into its directory
            #   run its preinstall script if it has one
            #   run its install script if it has one
            #   run its postinstall script if it has one

          '';
        };
    
    in lib.attrsets.concatMapAttrs (
      name: value: {
        ${value.name} = mkNodeModules { inherit modules pkgset; } value;
      }
    ) localPackages;

in mkWorkspace