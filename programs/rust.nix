{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.rust;
in
  {
    options.rust =
      {
        user = mkOption { type = types.str; };
      };

    config =
      {
        environment.variables = { RUSTUP_DIST_SERVER = "https://mirrors.tuna.tsinghua.edu.cn/rustup"; };
        home-manager.users.${cfg.user}.home.file.".cargo/config".text =
          ''
            [source.crates-io]
            replace-with = 'tuna'

            [source.tuna]
            registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"
          '';
      };
  }
