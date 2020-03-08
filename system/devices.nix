{ config, pkgs, ... }:

{
  hardware.cpu.amd.updateMicrocode = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;
}
