{ nixpkgs, home-manager, ... }:
(
  nixpkgs.lib.nixosSystem rec {
    system = "aarch64-linux";
    modules = [
      ./configuration.nix
      ./lxd.nix
      home-manager.nixosModules.home-manager
      ../../modules/nix.nix
    ];
  }
)
