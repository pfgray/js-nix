export type ParsedLockFile = {
  local: Record<string, Extract<ParsedPackage, { type: "local" }>>;
  remote: Record<string, Extract<ParsedPackage, { type: "remote" }>>;
};

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
      peerDependencies: string[];
      src: {
        name?: string;
        url: string;
        hash: string;
      };
    }
);
