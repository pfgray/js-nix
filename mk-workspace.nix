{lib, stdenv, fetchurl, nodejs, jq}:

let

  # srcForGithub = {name, pkg, ...}: fetchurl {
  #   name = "${name}.tgz";
  #   url = pkg.url;
  #   hash = pkg.hash;
  # };

  # makes a node module for
  mkWorkspace = { lockfile, context }:
    let
      packages = builtins.fromJSON (builtins.readFile lockfile);
      local = builtins.mapAttrs (name: l: l // {
        src = context + l.src;
      }) packages.local;
      remote = builtins.mapAttrs (name: r: (r // {
        src = fetchurl {
          inherit (r.src) name url hash;
        };
      })) packages.remote;
    in {
      local = local;
      remote = remote;
      all = local // remote;
    };

in mkWorkspace