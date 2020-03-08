{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.vscode;
in
  {
    options.vscode =
      {
        user = mkOption { type = types.str; };
      };

      config.home-manager.users.${cfg.user}.programs.vscode =
        {
          enable = true;
          userSettings = {};
        };
  }