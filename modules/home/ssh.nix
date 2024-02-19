{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    extraConfig = ''
            Host *
      	      IdentityAgent ~/.1password/agent.sock

            Host *.github.com
              AddKeysToAgent yes
              IdentityFile ~/.ssh/id_ed25519
              User git

            Host wakey
              HostName 138.68.170.235
              AddKeysToAgent yes
              IdentityFile ~/.ssh/id_ed25519
              User root

            Host wakey-rpc
              HostName 167.71.128.201
              AddKeysToAgent yes
              IdentityFile ~/.ssh/id_ed25519
              User root

            Host kaiserkarel
              HostName 178.62.75.58
              AddKeysToAgent yes
              IdentityFile ~/.ssh/id_ed25519
              User root
      
            Host beefcake 
              HostName 144.76.140.13
              AddKeysToAgent yes
              IdentityFile ~/.ssh/id_ed2551
              IdentitiesOnly yes
              User root
    '';
  };
}
