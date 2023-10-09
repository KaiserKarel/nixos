{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *.github.com
        AddKeysToAgent yes
        IdentityFile ~/.ssh/id_ed25519
        User git
    '';
  };
}
