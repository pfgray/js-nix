{lib, stdenv, fetchurl, nodejs, jq}:

let

  packageStr = pkg: "${pkg.name}@${pkg.version}";

  removeLastPathSegment = str: 
    let
      parts = lib.splitString "/" str;
    in builtins.concatStringsSep "/" (lib.lists.take ((builtins.length parts) - 1) parts);

  hasScript = scriptName: "test \"$(${jq}/bin/jq -e -r '.scripts | .${scriptName} | length' < package.json)\" -gt 0";

  linkDeps = pkgset: node_modules_folder: pkg:
    let
      pkgs = (builtins.attrValues (pkgset));

      findPkgByNameAndVersion = name: version: (
        lib.findFirst 
          (pkg: pkg.name == name && pkg.version == version)
          (throw "Package ${name}@${version} (a dependency of ${packageStr pkg}) wasn't found in the resolved package set. Do you need to re-run js-nix?")
          pkgs
      );

      scriptLines = builtins.concatStringsSep ("\n");

      linkDep = node_modules_folder: pkg: 
        let
          nm = mkNodeModule pkgset pkg;
          pkgJson = lib.importJSON "${nm}/package.json";
          bins =
            if builtins.hasAttr "bin" pkgJson
              then
                if builtins.isString pkgJson.bin
                  then
                    ["${nm}/${pkgJson.bin}"]
                  else
                    if builtins.isAttrs pkgJson.bin
                      then
                        lib.attrsets.attrValues (
                          lib.attrsets.mapAttrs (name: path: "${nm}/${path}") pkgJson.bin
                        )
                      else throw ("Package ${packageStr pkg} has a bin section in package.json, but it's not a string or an object.")
              else [];
          binFolder = node_modules_folder + "/.bin";
        in {
          binLinksCmd =
            scriptLines (builtins.map (bin: (''
              ln -s ${bin} ${binFolder}/${builtins.baseNameOf bin}
            '')) bins);
          moduleLinkCmd = ''
            # ensure directories here
            mkdir -p ${node_modules_folder}/${removeLastPathSegment pkg.name}
            ln -s ${nm} ${node_modules_folder}/${pkg.name}
            # if there's a bin section in package.json, link the binaries
          '';
        };

      moduleLinks = builtins.map (linkDep node_modules_folder) (
        (builtins.attrValues (builtins.mapAttrs (findPkgByNameAndVersion) pkg.dependencies))
      );

      moduleLinkCmds = scriptLines (builtins.map (ml: ml.moduleLinkCmd) (moduleLinks));
      binLinkCmds = scriptLines (builtins.map (ml: ml.binLinksCmd) (moduleLinks));
      
    in ''
      mkdir -p ${node_modules_folder}/.bin
      ${moduleLinkCmds}
      ${binLinkCmds}
    '';

  mkRemoteNodeModule = pkgset: pkg:
    let
      tarball = (lib.lists.last (lib.splitString "/" pkg.name)) + "-" + pkg.version + ".tgz";
      url = "https://registry.npmjs.org/${pkg.name}/-/${tarball}";
    in stdenv.mkDerivation {
      name = "${pkg.name}-${pkg.version}";
      src = pkg.src;

      buildInputs = [nodejs];

      buildPhase = ''
        export HOME=$(pwd)
        mkdir node_modules
        ${linkDeps pkgset "node_modules" pkg}
        if ${hasScript "preinstall"}; then
          npm run-script preinstall
        fi
        if ${hasScript "install"}; then
          npm run-script install
        fi
        if ${hasScript "postinstall"}; then
          npm run-script postinstall
        fi
        cp -R ./ $out
      '';
    };

  mkLocalNodeModule = pkgset: pkg: 
    let
      substringFrom = from: str: builtins.substring from (builtins.stringLength str) str;
      replaceSlashes = str: builtins.replaceStrings ["/"] ["-"] str;
      removeFirstAtSign = str: if lib.strings.hasPrefix "@" str then substringFrom 1 str else str;
      fixName = name: removeFirstAtSign (replaceSlashes name);
    in builtins.trace (builtins.toString pkg.src) (stdenv.mkDerivation {
      name = "${pkg.name}-${pkg.version}";
      buildInputs = [nodejs];
      src = pkg.src;

      buildPhase = ''
        export HOME=$(pwd)
        mkdir node_modules
        echo "current working directory is: $PWD"
        ${linkDeps pkgset "node_modules" pkg}
        # echo "path is: $PATH"
        npm run-script build
        npm pack
        mkdir $out
        tar -xf ${fixName pkg.name}-${pkg.version}.tgz -C $out
        mv $out/package/* $out/
        rm -rf $out/package
        mkdir -p $out/node_modules
        cp -R node_modules/* $out/node_modules
      '';
    });

  mkNodeModule = pkgs: pkg:
    (if pkg.type == "remote" then (mkRemoteNodeModule pkgs pkg) else mkLocalNodeModule pkgs pkg);
in mkNodeModule