{ nixpkgs, home-manager, vscode-server, ... }:
(
  nixpkgs.lib.nixosSystem rec {
    system = "aarch64-linux";
    modules = [
      ./configuration.nix
      ./lxd.nix
      home-manager.nixosModules.home-manager
      ../../modules/nix.nix
      vscode-server.nixosModules.default
      ({ config, pkgs, ... }: {
        services.vscode-server.enable = true;
        services.vscode-server.nodejsPackage = pkgs.nodejs-18_x;
      })
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.k = {
            home.stateVersion = "23.05";
            imports = [
              ../../modules/home/git.nix
              ../../modules/home/ssh.nix
            ];
          };
        };
      }
    ];
  }
)
