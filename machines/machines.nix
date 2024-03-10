{ nixpkgs, home-manager, ... }:
{
  mara = import ./mara/nixosSystem.nix { inherit nixpkgs home-manager; };
  orb = import ./orb/nixosSystem.nix { inherit nixpkgs home-manager; };
}

