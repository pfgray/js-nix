{lib, stdenv, fetchurl, nodejs, jq}:

let

  # makes a node module for
  mkWorkspace = { modules }:
    let
      packages = import modules;

      remote = builtins.mapAttrs (name: r: (r // {
        src = fetchurl {
          inherit (r.src) name url hash;
        };
      })) packages.remote;
    in {
      inherit (packages) local;
      inherit remote;
      all = packages.local // remote;
    };

in mkWorkspace