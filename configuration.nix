# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./i3.nix
      ./font.nix
      ./system.nix
      ./programs.nix
      ./graphics.nix
      ./hardware-configuration.nix
      "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
    ];

  sysConfig =
    {
      hostName = "hakugyokurou";
      timeZone = "Asia/Shanghai";
      defaultLocale = "en_US.UTF-8";
    };

  myPrograms =
    {
      user = "yuumu";
      gitUserName = "InanimateDream";
      gitUserEmail = "MLTT2HoTT@outlook.com";
    };

  services =
    {
      openssh.enable = true;
      chrony.enable = true;
    };

  home-manager.users.yuumu = {
    programs = {
      # TODO: HOW TO USE IT
      broot = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };

  users = {
    users.yuumu = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  environment.systemPackages = with pkgs; [
    neofetch lolcat gnupg p7zip
    wget vim httpie tokei thefuck
    curl htop iftop iotop lsof psmisc
    lsd ripgrep bat sd fd xclip
    gnumake colormake pinfo rlwrap

    pandoc

    python3
    python37Packages.pip
    python37Packages.pygments
    python37Packages.virtualenv
    nodejs-12_x
    binutils
    rustup

    vscode
    firefox
    tdesktop
    jetbrains.pycharm-professional
    jetbrains.webstorm
    jetbrains.clion
  ];
}
