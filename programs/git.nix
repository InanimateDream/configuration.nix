{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.git;
  ohMyZsh = config.programs.zsh.ohMyZsh;
in
  {
    options.git =
      {
        user = mkOption { type = types.str; };
        gitUserName = mkOption { type = types.str; };
        gitUserEmail = mkOption { type = types.str; };
      };

    config.home-manager.users.${cfg.user}.programs.git =
      {
        enable = true;
        userName = cfg.gitUserName;
        userEmail = cfg.gitUserEmail;
      };
  }
