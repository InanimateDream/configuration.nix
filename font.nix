{ config, pkgs, ... }:

{
  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [
      fira
      fira-code
      sarasa-gothic
      wqy_zenhei
      wqy_microhei
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      # nerdfonts
      powerline-fonts
    ];

    fontconfig = {
      hinting.enable = false;

      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        serif = [ "Noto Serif CJK SC" ];
        sansSerif = [ "Noto Sans CJK SC" ];
        monospace = [ "Sarasa Mono SC" ];
      };
    };
  };
}
