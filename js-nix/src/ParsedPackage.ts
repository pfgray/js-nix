export type ParsedPackage = {
  name: string;
  version: string;
  dependencies: Record<string, string>;
} & (
  | {
      type: "local";
      src: string;
    }
  | {
      type: "remote";
      src: {
        name?: string;
        url: string;
        hash: string;
      };
    }
);

// https://registry.npmjs.org/${name}/-/${tarball}
