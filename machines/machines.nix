{ nixpkgs, home-manager, vscode-server, ... }:
{
  mara = import ./mara/nixosSystem.nix { inherit nixpkgs home-manager; };
  orb = import ./orb/nixosSystem.nix { inherit nixpkgs home-manager vscode-server; };
}

