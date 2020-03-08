{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.network;
in
  {
    options.network =
      {
        hostName = mkOption { type = types.str; };
      };

    config.networking =
       {
        hostName = cfg.hostName;
        # wireless.enable = true; # Enables wireless support via wpa_supplicant.

        # The global useDHCP flag is deprecated, therefore explicitly set to false here.
        # Per-interface useDHCP will be mandatory in the future, so this generated config
        # replicates the default behaviour.
        useDHCP = false;
        interfaces.enp0s3.useDHCP = true;

        # Open ports in the firewall.
        # networking.firewall.allowedTCPPorts = [ ... ];
        # networking.firewall.allowedUDPPorts = [ ... ];
        # Or disable the firewall altogether.
        # networking.firewall.enable = false;
      };
  }
