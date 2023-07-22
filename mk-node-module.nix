{lib, stdenv, fetchurl, nodejs, jq}:

let

  hasScript = scriptName: "test \"$(${jq}/bin/jq -e -r '.scripts | .${scriptName} | length' < package.json)\" -gt 0";

  # makes a node module for
  mkRemoteNodeModule = pkgset: pkg:
    let
      #  pkgs = builtins.attrValues pkgset;
      #  tarball = (lib.lists.last (lib.splitString "/" pkg.name)) + "-" + pkg.version + ".tgz";
      #  url = "https://registry.npmjs.org/${pkg.name}/-/${tarball}";

      #  findPkgByNameAndVersion = name: version: (lib.findFirst (pkg: pkg.name == name && pkg.version == version) 5 pkgs);

      # linkDep = node_modules_folder: pkg: ''
      #   ln -s ${mkNodeModule pkg} ${node_modules_folder}/${pkg.name}
      # '';

      # linkDeps = node_modules_folder: builtins.trace pkgs (builtins.concatStringsSep ("\n") (
      #   builtins.map (linkDep node_modules_folder) (
      #     builtins.mapAttrs findPkgByNameAndVersion (builtins.trace (pkg.dependencies) pkg.dependencies)
      #   )
      # ));
      linkDeps = foo: "echo 'success'";
    in stdenv.mkDerivation {
      name = "${pkg.name}-${pkg.version}";
      src = pkg.src;

      buildInputs = [nodejs];

      installPhase = ''
        mkdir node_modules
        ${linkDeps "node_modules"}
      '';

      buildPhase = ''
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

  mkLocalNodeModule = pkg: stdenv.mkDerivation {
    name = "${pkg.name}-${pkg.version}";
    buildInputs = [nodejs];
    src = pkg.src;
    buildPhase = ''
      npm pack
    '';
  };

  mkNodeModule = pkgs: pkg:
    (if pkg.type == "remote" then (mkRemoteNodeModule pkgs pkg) else mkLocalNodeModule pkg);
in mkNodeModule



  # mkGitNodeModule = pkg: stdenv.mkDerivation {
  #   name = "${pkg.name}-${pkg.version}";
  #   buildInputs = [nodejs];
  #   src = fetchurl {
  #     name = "${pkg.name}.tgz";
  #     url = pkg.url;
  #     hash = pkg.hash;
  #   };
  #   buildPhase = ''
  #     export HOME=$(pwd)

  #     if ${hasScript "preinstall"}; then
  #       npm run-script preinstall
  #     fi

  #     if ${hasScript "install"}; then
  #       npm run-script install
  #     fi

  #     if ${hasScript "postinstall"}; then
  #       npm run-script postinstall
  #     fi

  #     npm pack

  #     mkdir $out
  #     tar -xf ${pkg.name}-${pkg.version}.tgz -C $out
  #     mv $out/package/* $out/
  #     rm -rf $out/package
  #   '';
  # };