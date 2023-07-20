{
  packages = [
    {
      type = "node";
      name = "left-pad";
      version = "1.3.0";
      hash = "sha256-hwwP4QliI6WNT4gy0Ip+ZR6i/K245od7L9wmtmLUgd0=";
      deps = [];
    }
    {
      type = "node";
      name = "ts-adt";
      version = "2.1.2";
      hash = "sha256-zDmLJtxbMg/Awvy8nwubxFwZXTLsbM1N2Eyi7xQGcYo=";
      deps = [];
    }
    {
      type = "node";
      name = "node-sass";
      version = "9.0.0";
      hash = "sha256-XSjbX3EoT7LvLsjh+mbef/Xj1iutSlFBQdOmYM0aFZ0=";
      deps = [];
      # sha512-yltEuuLrfH6M7Pq2gAj5B6Zm7m+gdZoG66wTqG6mIZV/zijq3M2OO2HswtT6oBspPyFhHDcaxWpsBm0fRNDHPg==
    }
    {
      type = "local";
      name = "@test/common";
      src = ./packages/common;
      deps = [
        {
          name = "left-pad";
          version = "1.3.0";
        }
        {
          name = "ts-adt";
          version = "2.1.2";
        }
      ];
    }
  ];
}