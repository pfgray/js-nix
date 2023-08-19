import { ReadonlyArray, ReadonlyRecord, pipe } from "effect";
import { ParsedLockFile } from "./ParsedPackage";

export const renderParsedLockFile = (parsedLockFile: ParsedLockFile) => {
  const renderedLocal = Object.entries(parsedLockFile.local)
    .map(([name, pkg]) => {
      const renderedDependencies = Object.entries(pkg.dependencies)
        .map(([name, version]) => {
          return `        "${name}" = "${version}";`;
        })
        .join("\n");
      return `    "${name}" = {
      type = "local";
      version = "${pkg.version}";
      name = "${pkg.name}";
      src = ./${pkg.src};
      dependencies = {
${renderedDependencies}
      };
    };`;
    })
    .join("\n");

  const renderSpaces = (items: string[]) => {
    if (items.length === 0) {
      return items.join("\n");
    } else {
      return "\n" + items.join("\n") + "\n      ";
    }
  };

  const renderedRemote = Object.entries(parsedLockFile.remote)
    .map(([name, pkg]) => {
      const renderedDependencies = pipe(
        pkg.dependencies,
        ReadonlyRecord.toEntries,
        ReadonlyArray.map(([name, version]) => {
          return `        "${name}" = "${version}";`;
        }),
        renderSpaces
      );
      const renderedPeerDependencies = pipe(
        pkg.peerDependencies,
        ReadonlyArray.map((name) => {
          return `        "${name}"`;
        }),
        renderSpaces
      );
      return `    "${name}" = {
      type = "remote";
      version = "${pkg.version}";
      name = "${pkg.name}";
      src = {
        name = "${pkg.src.name}";
        url = "${pkg.src.url}";
        hash = "${pkg.src.hash}";
      };
      dependencies = {${renderedDependencies}};
      peerDependencies = [${renderedPeerDependencies}];
    };`;
    })
    .join("\n");

  return `{
  local = {
${renderedLocal}
  };
  remote = {
${renderedRemote}
  };
}`;
};
