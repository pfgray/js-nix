{stdenv, buildNpmPackage, nodejs, writeShellScript, curl, openssl, lib, makeWrapper}:
  let
    package = buildNpmPackage rec {
      pname = "js-nix";
      version = "1.0.0";
      src = ./.;
      buildInputs = [
        curl
        openssl
      ];
      installPhase = ''
        npm run-script build
        mkdir -p $out
        mv lib $out/lib
        mv package.json $out/package.json
        mv node_modules $out/node_modules
      '';
      npmDepsHash = "sha256-5hT8z7bp0QBkb0mhQj66zrfzJBwily39wv7kNDY0HrM=";
    };
    js-nix-bin = writeShellScript "js-nix" ''
      ${nodejs}/bin/node ${package}/lib/index.js $@
    '';
    js-nix = stdenv.mkDerivation {
      name = "js-nix";
      dontUnpack = true;
      buildInputs = [
        makeWrapper
      ];
      buildPhase = ''
        mkdir -p $out/bin
        cp ${js-nix-bin} $out/bin/js-nix
        wrapProgram $out/bin/js-nix \
          --set PATH ${lib.makeBinPath [
            curl
            openssl
          ]}
      '';
    };
  in { inherit package js-nix; }