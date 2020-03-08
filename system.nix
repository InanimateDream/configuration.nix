{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.sysConfig;
in
  {
    imports =
      [
        system/boot.nix
        system/fstab.nix
        system/sound.nix
        system/devices.nix
        system/network.nix
        system/time-locale.nix
      ];

    options.sysConfig =
      {
        hostName = mkOption { type = types.str; };
        timeZone = mkOption { type = types.str; };
        defaultLocale = mkOption { type = types.str; };
      };

    config =
      {
        network.hostName = cfg.hostName;
        timeLocale.timeZone = cfg.timeZone;
        timeLocale.defaultLocale = cfg.defaultLocale;

        system =
          {
            stateVersion = "19.09";
            autoUpgrade =
              {
                enable = true;
                channel = https://nixos.org/channels/nixos-unstable;
              };
          };
      };
  }
