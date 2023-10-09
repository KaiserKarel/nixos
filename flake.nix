{
  description = "NixOS systems and tools by Karel";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
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
  };

  outputs = { nixpkgs, treefmt-nix, flake-parts, home-manager, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        nixosConfigurations = {
          mara = nixpkgs.lib.nixosSystem rec {
            system = "x86_64-linux";
            modules = [
              ./configuration.nix
              ./hardware-configuration.nix
              ./modules/openssh.nix
              ./modules/nix.nix
              ./modules/postgres.nix

              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.k = {
                    home.stateVersion = "23.05";
                    imports = [
                      ./modules/gtk.nix


                      ./modules/home/vscode.nix
                      ./modules/home/git.nix
                      ./modules/home/ssh.nix
                    ];
                  };
                };
              }
            ];
          };
        };
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
