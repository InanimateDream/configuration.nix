{ config, pkgs, ... }:

{
  services.xserver =
    {
      enable = true;
      layout = "us";
      xkbOptions = "caps:escape";
      videoDrivers =
        [
          "radeon"
          "nouveau"
          "vboxvideo"
          "vmware"
          "vesa"
          "fbdev"
        ];

      displayManager.startx.enable = true;
      desktopManager.xterm.enable = false;
    };
}
