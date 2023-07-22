type Package = {
  type: "local" | "remote";
  name: string;
  version: string;
  dependencies: Record<string, string>;
  src: {
    name?: string;
    url: string;
    hash: string;
  };
};

// pnpm-specific:
// resolution:
// | {
//     integrity: string;
//   }
// | {
//     tarball: string;
//   }
// | {
//     commit: string;
//     repo: string;
//   };
