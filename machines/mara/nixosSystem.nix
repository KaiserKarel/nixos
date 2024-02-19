{ nixpkgs, home-manager, ... }:
(
  nixpkgs.lib.nixosSystem rec {
    system = "x86_64-linux";
    modules = [
      ./configuration.nix
      ./hardware-configuration.nix
      ../../modules/openssh.nix
      ../../modules/nix.nix
      ../../modules/1pass.nix
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.k = {
            home.stateVersion = "23.05";
            imports = [
              ../../modules/home/gtk.nix
              ../../modules/home/vscode.nix
              ../../modules/home/git.nix
              ../../modules/home/ssh.nix
            ];
          };
        };
      }
    ];
  }
)
