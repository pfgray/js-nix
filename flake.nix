{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  };

  outputs = { flake-utils, nixpkgs, ... }:
    # Now eachDefaultSystem is only using ["x86_64-linux"], but this list can also
    # further be changed by users of your flake.
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        }; 
        js-nix = pkgs.callPackage ./js-nix {};
        convert = pkgs.writeShellScriptBin "convert" ''
          ${pkgs.yq-go}/bin/yq -o=json eval pnpm-lock.yaml > pnpm-lock.json
        '';
      in {
        
        devShell = pkgs.mkShell {
          packages = with pkgs; [
            nodejs.pkgs.pnpm
            pkgs.nodejs-18_x
            convert
          ];
        };
        packages = let

          mkNodeModule = pkgs.callPackage ./mk-node-module.nix {};
          mkWorkspace = pkgs.callPackage ./mk-workspace.nix {};

          # js-packages = import ./js-packages.nix;
          # js-packages-by-name = builtins.mapAttrs (name: builtins.head) (builtins.groupBy (pkg: pkg.name) js-packages.packages);
          # js-builds = pkgs.lib.attrsets.mapAttrs (name: dep: mkNodeModule js-packages.packages dep) ((builtins.trace (builtins.attrNames js-packages-by-name)) js-packages-by-name);

          workspaces = (mkWorkspace {
            lockfile = ./js-nix-lock.json;
            context = ./.;
          });
          
          jsPackages = builtins.mapAttrs (
            name: builtins.mapAttrs (name: mkNodeModule workspaces.all)
          ) workspaces;

          local = pkgs.lib.attrsets.concatMapAttrs (
            name: value: {
              ${value.name} = mkNodeModule workspaces.all value;
            }
          ) workspaces.local;

        in {
          # inherit packages;
          # inherit (js-nix) js-nix;
          js-nix = js-nix.js-nix;
          foo = jsPackages.all.${"ts-adt@2.1.2"};
          # packagesList = builtins.mapAttrs (name: builtins.attrNames) packages;
          # remotePackages = packages.
        } // local;
      });
}