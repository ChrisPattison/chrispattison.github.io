{
  description = "A simple flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-25.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.localwebsite = pkgs.writeShellApplication {
            name = "localwebsite";
            runtimeInputs = [
              pkgs.jekyll
            ];
            text = ''
              bundle exec jekyll serve
            '';
          };

      });
}
