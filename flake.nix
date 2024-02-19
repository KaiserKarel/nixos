{
  description = "NixOS systems and tools by Karel";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:unionlabs/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = { nixpkgs, treefmt-nix, flake-parts, home-manager, sops-nix, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        nixosConfigurations = import ./machines/machines.nix { inherit nixpkgs home-manager; };
      };
      systems =
        [ "x86_64-linux" ];
      imports = [
        treefmt-nix.flakeModule
      ];
      perSystem = { config, self', inputs', pkgs, system, lib, ... }:
        {
          treefmt = {
            projectRootFile = "flake.nix";
            programs.nixpkgs-fmt.enable = true;
          };
        };
    };
}
