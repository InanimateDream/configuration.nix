{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.myPrograms;
in
  {
    imports =
      [
        programs/vim.nix
        programs/git.nix
        programs/rust.nix
        programs/shell.nix
      ];

    options.myPrograms =
      {
        user = mkOption { type = types.str; };
        gitUserName = mkOption { type = types.str; };
        gitUserEmail = mkOption { type = types.str; };
      };

    config =
      {
        nixpkgs.config.allowUnfree = true;
        home-manager.users.${cfg.user}.nixpkgs.config.allowUnfree = true;

        # Some programs need SUID wrappers, can be configured further or are
        # started in user sessions.
        # programs.mtr.enable = true;
        # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

        rust.user = cfg.user;
        vim.user = cfg.user;
        git =
          {
            user = cfg.user;
            gitUserName = cfg.gitUserName;
            gitUserEmail = cfg.gitUserEmail;
          };
      };
  }
