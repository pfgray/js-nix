type Package = {
  resolution:
    | {
        integrity: string;
      }
    | {
        tarball: string;
      }
    | {
        commit: string;
        repo: string;
      };
};
