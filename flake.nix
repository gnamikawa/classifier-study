{
  description = "Project template devShell (treefmt + repo hooks)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      treefmt-nix,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        treefmtEval = treefmt-nix.lib.evalModule pkgs {
          projectRootFile = "flake.nix";
          programs.nixfmt.enable = true;
          programs.prettier.enable = true;
          settings.formatter.prettier = {
            includes = [
              "*.md"
              "*.json"
            ];
            excludes = [
              "flake.lock"
            ];
          };
        };

        treefmt = treefmtEval.config.build.wrapper;
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            treefmt
          ];

          shellHook = ''
            git config core.hooksPath .githooks

            echo "Devshell ready."
            echo "  treefmt   # format all sources"
          '';
        };

        formatter = treefmt;
        checks.formatting = treefmtEval.config.build.check self;
      }
    );
}
