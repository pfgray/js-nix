{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  };

  outputs = { flake-utils, nixpkgs, ... }:
  # Now eachDefaultSystem is only using ["x86_64-linux"], but this list can also
  # further be changed by users of your flake.
  flake-utils.lib.eachDefaultSystem (system: 
  let pkgs = import nixpkgs {
    inherit system;
  }; in {
    devShell = pkgs.mkShell {
      packages = with pkgs; [
        nodejs.pkgs.pnpm
        pkgs.nodejs-18_x
      ];
    };
    packages = let

      deps =  builtins.fromJSON (builtins.readFile ./pnpm-lock.json);

      thing = pkgs.lib.attrsets.mapAttrs (name: dep: (builtins.trace (builtins.attrNames dep)) {
      }) deps.dependencies;

      mkNodeModule = pkgs.callPackage ./mk-node-module.nix {};
      js-packages = import ./js-packages.nix;

      js-packages-by-name = builtins.mapAttrs (name: builtins.head) (builtins.groupBy (pkg: pkg.name) js-packages.packages);

      js-builds = pkgs.lib.attrsets.mapAttrs (name: dep: mkNodeModule js-packages.packages dep) ((builtins.trace (builtins.attrNames js-packages-by-name)) js-packages-by-name);

    in js-builds;
  });
}