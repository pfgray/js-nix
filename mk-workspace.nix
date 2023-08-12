{lib, stdenv, fetchurl, nodejs, jq, callPackage}:

let
  # Takes a string like "foo@1.0.0" or @test/foo and returns "foo"/"@test/foo"
  parseName = pkgName:
    let 
      removeVersion = str: builtins.head (lib.strings.splitString "@" str);
      removeFirstChar = str: builtins.substring 1 (builtins.length str) str;
    in
      if lib.strings.hasPrefix "@" pkgName
      then
        "@${removeVersion (removeFirstChar pkgName)}"
      else removeVersion pkgName;
  # makes a node module for
  mkWorkspace = { modules }:
    let
      mkNodeModule = callPackage ./mk-node-module.nix {};

      packagesMetadata = import modules;

      fixedRemoteMetadata = builtins.mapAttrs (name: r: (r // {
        src = fetchurl {
          inherit (r.src) name url hash;
        };
      })) packagesMetadata.remote;

      allMetadata = packagesMetadata.local // fixedRemoteMetadata;

      jsModules = builtins.mapAttrs (
        type: builtins.mapAttrs (name: mkNodeModule allMetadata)
      ) packagesMetadata;

      # rename local packages as to make it easier to reference them
      local = lib.attrsets.concatMapAttrs (
        name: value: {
          ${value.name} = mkNodeModule allMetadata value;
        }
      ) packagesMetadata.local;

      # linkModule = module: ''
      #   ln -s 
      # ''

      # node_modules = stdenv.mkDerivation {
      #   name = "node_modules";
      #   dontUnpack = true;
      #   installPhase = ''
      #     mkdir -p $out
          
      #   '';
      # };
    in {
      # local = {
      #  ["@test/common"] : derivation
      # }
      #
      # node_modules: derivation
      #
      packages = local;
    };

in mkWorkspace