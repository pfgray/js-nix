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
        mkWorkspace = pkgs.callPackage ./mk-workspace.nix {};
        convert = pkgs.writeShellScriptBin "convert" ''
          ${pkgs.yq-go}/bin/yq -o=json eval pnpm-lock.yaml > pnpm-lock.json
        '';
      in {
        lib = {
          mkWorkspace = mkWorkspace;
        };
        
        devShell = pkgs.mkShell {
          packages = with pkgs; [
            nodejs.pkgs.pnpm
            pkgs.nodejs-18_x
            convert
          ];
        };
        packages = let

          workspaces = (mkWorkspace {
            modules = ./js-modules.nix;
          });

        in {
          inherit (js-nix) js-nix;
          excludePeerDeps = pkg: pkg // { includePeerDependencies = false; };
        } // workspaces.packages;
      });
}