{ nixpkgs, home-manager, ... }:
(
  nixpkgs.lib.nixosSystem rec {
    system = "aarch64-linux";
    modules = [
      ./configuration.nix
      ./lxd.nix
      home-manager.nixosModules.home-manager
      ../../modules/nix.nix
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.k = {
            home.stateVersion = "23.05";
            imports = [
              ../../modules/home/git.nix
            ];
          };
        };
      }    
    ];
  }
)
