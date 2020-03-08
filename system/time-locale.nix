{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.timeLocale;
  isXkb = !isNull config.services.xserver.layout;
in
  {
    options.timeLocale =
      {
        timeZone = mkOption { type = types.str; };
        defaultLocale = mkOption { type = types.str; };
      };

    config =
      {
        time.timeZone = cfg.timeZone;
        console.keyMap = mkIf (!isXkb) "us";
        console.useXkbConfig = mkIf isXkb true;
        i18n =
          {
            defaultLocale = cfg.defaultLocale;
            supportedLocales =
              [
                "en_US.UTF-8/UTF-8"
                "zh_CN.UTF-8/UTF-8"
              ];
            inputMethod =
              {
                enabled = "fcitx";
                fcitx.engines = with pkgs.fcitx-engines;
                  [
                    libpinyin
                    cloudpinyin
                  ];
              };
          };
      };
  }
