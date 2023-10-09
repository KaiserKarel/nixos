{
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "pgqueue" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
  };
}