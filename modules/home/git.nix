{ lib, ... }:
{
  programs.git = {
    enable = true;
    userName = "karel";
    userEmail = "k.l.kubat@gmail.com";
    lfs.enable = true;
    signing = {
      signByDefault = true;
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAY6rYPYLUl8ccZsZUUZgTyqpwp0CUIYsBhy+4Ub/UuB";
      gpgPath = "/opt/1Password/op-ssh-sign";
    };

    extraConfig = {
      color.ui = true;
      github.user = "kaiserkarel";
      gpg = {
        format = "ssh";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      "url \"ssh://git@github.com/\"".insteadOf = "https://github.com/";
    };
  };
}
