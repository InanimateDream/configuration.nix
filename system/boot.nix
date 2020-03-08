{ config, pkgs, ... }:

{
  boot.loader.grub =
    {
      enable = true;
      version = 2;
      device = "/dev/sda"; # "nodev" for efi only
    };
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
}
