{
  description = "Personal Blog";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem (system:
  let
    overlays = [ ];
    pkgs = import nixpkgs {inherit system overlays;};
    cmake-bin = pkgs.cmake;
    buildPkgs = with pkgs; [ ruby act ]; 
    project = pkgs.stdenv.mkDerivation {
      name = "cstml.github.io";
      root = self;
      buildInputs = buildPkgs;
    };
  in
  {
      defaultPackage = project;
      devShell = project;
  });
}
