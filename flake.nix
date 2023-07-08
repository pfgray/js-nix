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
    in rec {
      left-pad-tarball = pkgs.fetchurl {
        url = "https://registry.yarnpkg.com/left-pad/-/left-pad-1.3.0.tgz";
        sha512 = "sha512-XI5MPzVNApjAyhQzphX8BkmKsKUxD4LdyK24iZeQGinBN9yTQT3bFlCBy/aVx2HrNcqQGsdot8ghrjyrvMCoEA==";
      };

      left-pad-src = pkgs.stdenv.mkDerivation {
        name = "left-pad";
        src = pkgs.fetchurl {
          url = "https://registry.yarnpkg.com/left-pad/-/left-pad-1.3.0.tgz";
          sha512 = "sha512-XI5MPzVNApjAyhQzphX8BkmKsKUxD4LdyK24iZeQGinBN9yTQT3bFlCBy/aVx2HrNcqQGsdot8ghrjyrvMCoEA==";
        };
      };

      ts-adt-src = pkgs.stdenv.mkDerivation {
        name = "ts-adt";
        src = pkgs.fetchurl {
          name = "ts-adt.tar.gz";
          url = "https://codeload.github.com/pfgray/ts-adt/tar.gz/0fc91fc69336783143be08a76e5cb56c3ea3d4d6";
          hash = "sha512-GVDFz6fz0CN4kYSx+eCPhdySG75TbiAJNQR+OIsZEuQjEhNbng4OAWB3wc6hvpi55VN1RB9MmUotBc4OibmEbQ==";
        };
        installPhase = ''
          # Build the site to the $out directory
          mkdir -p $out
          cp -R ./* $out
        '';
      };

      ts-adt-files = pkgs.fetchurl {
        name = "ts-adt-files.tar.gz";
        url = "https://codeload.github.com/pfgray/ts-adt/tar.gz/0fc91fc69336783143be08a76e5cb56c3ea3d4d6";
        hash = "sha512-GVDFz6fz0CN4kYSx+eCPhdySG75TbiAJNQR+OIsZEuQjEhNbng4OAWB3wc6hvpi55VN1RB9MmUotBc4OibmEbQ==";
      };

      thing = builtins.trace (builtins.attrNames ts-adt-src) thing;
    };
  });
}