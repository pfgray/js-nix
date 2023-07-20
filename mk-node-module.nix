{lib, stdenv, fetchurl, nodejs, jq}:

let

  buildGitModule = pkg: stdenv.mkDerivation {
    name = "${pkg.name}-${pkg.version}";
    buildInputs = [nodejs];
    src = pkg.src;
    buildPhase = ''
      export HOME=$(pwd)

      if ${hasScript "postinstall"}; then
        npm run-script postinstall
      fi

      npm pack

      mkdir $out
      tar -xf ${pkg.name}-${pkg.version}.tgz -C $out
      mv $out/package/* $out/
      rm -rf $out/package
    '';
  };

  hasScript = scriptName: "test \"$(${jq}/bin/jq -e -r '.scripts | .${scriptName} | length' < package.json)\" -gt 0";

  # makes a node module for
  mkNpmNodeModule = pkgs: pkg:
    let
      tarball = (lib.lists.last (lib.splitString "/" pkg.name)) + "-" + pkg.version + ".tgz";
      url = "https://registry.npmjs.org/${pkg.name}/-/${tarball}";

      findPkgByNameAndVersion = pkgInfo: lib.findFirst (pkg: pkg.name == pkgInfo.name && pkg.version == pkgInfo.version) pkgInfo pkgs;

      linkDep = node_modules_folder: pkg: ''
        ln -s ${mkNodeModule pkg} ${node_modules_folder}/${pkg.name}
      '';

      linkDeps = node_modules_folder: builtins.concatStringsSep ("\n") (
        builtins.map (linkDep node_modules_folder) (
          builtins.map findPkgByNameAndVersion pkg.deps
        )
      );
    in stdenv.mkDerivation {
      name = "${pkg.name}-${pkg.version}";
      src = fetchurl {
        url = url;
        hash = pkg.hash;
      };

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

  mkGitNodeModule = pkg: stdenv.mkDerivation {
    name = "${pkg.name}-${pkg.version}";
    buildInputs = [nodejs];
    src = fetchurl {
      name = "${pkg.name}.tgz";
      url = pkg.url;
      hash = pkg.hash;
    };
    buildPhase = ''
      export HOME=$(pwd)

      if ${hasScript "preinstall"}; then
        npm run-script preinstall
      fi

      if ${hasScript "install"}; then
        npm run-script install
      fi

      if ${hasScript "postinstall"}; then
        npm run-script postinstall
      fi

      npm pack

      mkdir $out
      tar -xf ${pkg.name}-${pkg.version}.tgz -C $out
      mv $out/package/* $out/
      rm -rf $out/package
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

  mkNodeModule = pkgs: pkg: builtins.trace (pkg.type)
    (if pkg.type == "node" then (mkNpmNodeModule pkgs pkg) else mkGitNodeModule pkg);
in mkNodeModule