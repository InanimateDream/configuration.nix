{ config, pkgs, ... }:

{
  fileSystems =
    {
      "/vbs" =
        {
          device = "vbs";
          fsType = "vboxsf";
          options = [ "rw" ];
        };
    };
}
