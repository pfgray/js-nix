{buildNpmPackage, nodejs, writeShellScript}:
  let 
    package = buildNpmPackage rec {
      pname = "js-nix";
      version = "1.0.0";
      src = ./.;
      installPhase = ''
        npm run-script build
        mkdir -p $out
        mv lib $out/lib
        mv package.json $out/package.json
        mv node_modules $out/node_modules
      '';
      npmDepsHash = "sha256-5hT8z7bp0QBkb0mhQj66zrfzJBwily39wv7kNDY0HrM=";
    };
    js-nix = writeShellScript "js-nix" ''
      ${nodejs}/bin/node ${package}/lib/index.js $@
    '';
  in { inherit package js-nix; }