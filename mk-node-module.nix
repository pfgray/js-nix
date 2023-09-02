{lib, stdenv, fetchurl, nodejs, jq}:

let

  packageStr = pkg: "${pkg.name}@${pkg.version}";

  removeLastPathSegment = str: 
    let
      parts = lib.splitString "/" str;
    in builtins.concatStringsSep "/" (lib.lists.take ((builtins.length parts) - 1) parts);

  hasScript = scriptName: "test \"$(${jq}/bin/jq -e -r '.scripts | .${scriptName} | length' < package.json)\" -gt 0";

  linkDeps = includePeerDependencies: dep_chain: pkgset: node_modules_folder: pkg:
    let
      pkgs = (builtins.attrValues (pkgset));

      findPkgByNameAndVersion = name: version: (
        lib.findFirst
          (pkg: pkg.name == name && pkg.version == version)
          (throw "Package ${name}@${version} (a dependency of ${packageStr pkg}) wasn't found in the resolved package set. Do you need to re-run js-nix?")
          pkgs
      );

      scriptLines = builtins.concatStringsSep ("\n");

      pkgIsPeerDependency = dep:
        if (builtins.hasAttr "peerDependencies" pkg)
          then
            if builtins.elem dep.name (pkg.peerDependencies)
              then true
              else false
          else false;

      includePeerDepsWithOverride = if
        (builtins.hasAttr "includePeerDependencies" pkg)
        then pkg.includePeerDependencies
        else includePeerDependencies;

      linkDep = node_modules_folder: pkg:
        let
          nm = mkNodeModule includePeerDependencies dep_chain pkgset pkg;
          pkgJson = lib.importJSON "${nm}/package.json";
          bins =
            if builtins.hasAttr "bin" pkgJson
              then
                if builtins.isString pkgJson.bin
                  then
                    [{
                      name = builtins.baseNameOf pkgJson.bin;
                      file = pkgJson.bin;
                    }]
                  else
                    if builtins.isAttrs pkgJson.bin
                      then
                        lib.attrsets.attrValues (
                          builtins.mapAttrs (key: value: {
                            name = key;
                            file = value;
                          })
                          pkgJson.bin
                        )
                      else throw ("Package ${packageStr pkg} has a bin section in package.json, but it's not a string or an object.")
              else [];
          binFolder = node_modules_folder + "/.bin";
        in
          if !includePeerDepsWithOverride && (pkgIsPeerDependency pkg)
              # noop
              then {
                binLinksCmd = "";
                moduleLinkCmd = "";
              }
          else
            if builtins.elem (packageStr pkg) dep_chain
            then throw ("Dependency Cycle encountered while building ${packageStr pkg}, [${builtins.concatStringsSep " -> " dep_chain} -> ${packageStr pkg}]")
            else {
              binLinksCmd =
                scriptLines (builtins.map (bin: (''
                  echo "ln -s $PWD/${node_modules_folder}/${pkg.name}/${bin.file} $PWD/${binFolder}/${bin.name}"
                  ln -s $PWD/${node_modules_folder}/${pkg.name}/${bin.file} $PWD/${binFolder}/${bin.name}
                '')) bins);
              moduleLinkCmd = ''
                # ensure directories here
                mkdir -p ${node_modules_folder}/${removeLastPathSegment pkg.name}
                cp -R ${nm} ${node_modules_folder}/${pkg.name}
              '';
            };

      moduleLinks = (builtins.map (linkDep node_modules_folder) (
        (builtins.attrValues (builtins.mapAttrs (findPkgByNameAndVersion) pkg.dependencies))
      ));

      moduleLinkCmds = scriptLines (builtins.map (ml: ml.moduleLinkCmd) (moduleLinks));
      binLinkCmds = scriptLines (builtins.map (ml: ml.binLinksCmd) (moduleLinks));
      
    in ''
      mkdir -p ${node_modules_folder}/.bin
      ${moduleLinkCmds}
      ${binLinkCmds}
    '';

  substringFrom = from: str: builtins.substring from (builtins.stringLength str) str;
  removeFirstAtSign = str: if lib.strings.hasPrefix "@" str then substringFrom 1 str else str;
  derivationName = pkg: "${removeFirstAtSign pkg.name}_${pkg.version}";

  mkRemoteNodeModule = includePeerDependencies: dep_chain: pkgset: pkg:
    stdenv.mkDerivation {
      name = derivationName pkg;
      src = pkg.src;

      buildInputs = [nodejs];

      dontInstall = true;
      dontFixup = true;

      buildPhase = ''
        export HOME=$(pwd)
        mkdir node_modules
        ${linkDeps includePeerDependencies (dep_chain ++ [(packageStr pkg)]) pkgset "node_modules" pkg}

        if ${hasScript "preinstall"}; then
          npm run-script preinstall
        fi
        if ${hasScript "install"}; then
          npm run-script install
        fi
        if ${hasScript "postinstall"}; then
          npm run-script postinstall
        fi
        cp -RL ./ $out

        # self-referential node_module link to work around
        # a bug in typescript that doesn't follow symlinks
        # echo "building self-referential node_module link for ${pkg.name}"
        # echo "ln -s $out $out/node_modules/${pkg.name}"
        # mkdir -p $out/node_modules/${removeLastPathSegment pkg.name}
        # ln -s $out $out/node_modules/${pkg.name}
      '';
    };

  mkLocalNodeModule = includePeerDependencies: dep_chain: pkgset: pkg:
    let
      replaceSlashes = str: builtins.replaceStrings ["/"] ["-"] str;
      fixName = name: removeFirstAtSign (replaceSlashes name);
    in stdenv.mkDerivation {
      name = derivationName pkg;
      buildInputs = [nodejs];
      src = pkg.src;

      dontFixup = true;

      buildPhase = ''
        export HOME=$(pwd)
        mkdir node_modules
        ${linkDeps includePeerDependencies (dep_chain ++ [(packageStr pkg)]) pkgset "node_modules" pkg}
        npm run-script build
        npm pack
        mkdir $out
        tar -xf ${fixName pkg.name}-${pkg.version}.tgz -C $out
        mv $out/package/* $out/
        rm -rf $out/package
        mkdir -p $out/node_modules
        cp -R node_modules/* $out/node_modules
      '';
    };

  mkNodeModule = includePeerDependencies: dep_chain: pkgs: pkg:
    if pkg.type == "remote" then (mkRemoteNodeModule includePeerDependencies dep_chain pkgs pkg) else mkLocalNodeModule includePeerDependencies dep_chain pkgs pkg;
in mkNodeModule