{lib, stdenv, fetchurl, nodejs, jq}:

# for each package,
# {
#  
# }

let

  removeRoot = lib.attrsets.filterAttrs (n: v: n != ".");

  removeFirstChar = str: builtins.substring 1 (builtins.stringLength str) str;

  # Takes values like @test/common@1.0 and turns it into the name and version
  # {name = "@test/common"; version = "1.0"} 
  extractNameAndVersion = pkgName:
    let
      parts = builtins.filter (p: p != "") (lib.splitString "@" pkgName);
      name = if lib.strings.hasPrefix "@" pkgName then "@" + (builtins.head parts) else (builtins.head parts);
      fullVersion = builtins.substring (builtins.stringLength name + 1) (builtins.stringLength pkgName) pkgName;
      version = extractVersion fullVersion;
    in {
      inherit version;
      name = name;
    };

  extractVersion = versionStr: builtins.head (lib.splitString "(" versionStr);

  srcForIntegrity = {name, version, pkg, ...}: (
    let
      tarball = (lib.lists.last (lib.splitString "/" name)) + "-" + version + ".tgz";
      url = "https://registry.npmjs.org/${name}/-/${tarball}";
    in fetchurl {
      url = url;
      hash = pkg.resolution.integrity;
    });

  srcForGithub = {name, pkg, ...}: fetchurl {
    name = "${name}.tgz";
    url = pkg.url;
    hash = pkg.hash;
  };

  srcForPackage = {name, version, pkg}@attrs: 
    if builtins.hasAttr "integrity" (pkg.resolution) then (srcForIntegrity attrs) else (srcForGithub attrs);

  printPackage = pkg: "${pkg.name} - ${pkg.version} (${builtins.toString (builtins.length (lib.attrsets.attrValues pkg.dependencies))} deps)}))";

  formatDependencies = builtins.mapAttrs (name: value: {
    inherit name;
    version = extractVersion(
      if builtins.typeOf value == "string" then value
      else (
        if lib.strings.hasPrefix "link:" value.version then value.specifier else value.version
      )
    );
  });

  # makes a node module for
  mkWorkspace = { lockfile }:
    let
      packages = (builtins.fromJSON (builtins.readFile lockfile));
      localPackages = lib.attrsets.concatMapAttrs(nameKey: value:
        let
          packageDef = lib.importJSON (./. + "/${nameKey}" + /package.json);
          name = packageDef.name;
          version = packageDef.version;
          dependencies = (formatDependencies value.dependencies);
          devDependencies = (formatDependencies value.devDependencies);
        in {
          "${name}" = {
            type = "local";
            src = ./. + "/${nameKey}";
            inherit name version value;
            dependencies = dependencies // devDependencies;
          };
        }) (removeRoot packages.importers);

      remotePackages = (
        lib.attrsets.concatMapAttrs(
          nameKey: value: 
            let 
              pkgInfo = extractNameAndVersion (removeFirstChar nameKey);
            in {
              "${pkgInfo.name}@${pkgInfo.version}" = {
                type = "remote";
                inherit (pkgInfo) name version;
                src = srcForPackage {inherit (pkgInfo) name version; pkg = value;};
                dependencies = if builtins.hasAttr "dependencies" value then (formatDependencies value.dependencies) else {};
              };
            }
        ) packages.packages
      );
    in {
      local = localPackages;
      remote = remotePackages;
      all = localPackages // remotePackages;
    };

in mkWorkspace