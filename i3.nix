{ config, pkgs, ... }: 

{
  home-manager.users.yuumu = rec {
    home = {
      file = {
        ".xinitrc".text =
        ''
          exec i3
        '';
      };
  
      packages = with pkgs; [ conky ];
    };
  
      programs = {
        feh.enable = true;
        termite = {
          enable = true;
        
          font = "Iosevka Nerd Font Medium 12";
          backgroundColor = "#212121";
          clickableUrl = true;
        };
  
        rofi = {
          enable = true;
          terminal = "termite";
          font = "Iosevka Nerd Font Medium 16";
          theme = "DarkBlue"; # TODO: Change Theme
        };
      };
  
      
      xsession = {
        enable = true;
        numlock.enable = true;
  
        windowManager.i3 = {
          enable = true;
          package = pkgs.i3-gaps;
          
          config = rec {
            modifier = "Mod4";
            keybindings = {
              "${modifier}+Return" = "exec termite";
              "${modifier}+Shift+q" = "kill";

              # reload the configuration file
              "${modifier}+Shift+c" = "reload";

              # restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
              "${modifier}+Shift+r" = "restart";

              # exit i3 (logs you out of your X session)
              "${modifier}+Shift+e" = "exec \"i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'\"";

              "${modifier}+d" = "exec rofi -combi-modi window#drun#ssh -show combi";
              "${modifier}+Shift+d" = "exec rofi -show run";

              # change focus
              "${modifier}+j" = "focus left";
              "${modifier}+k" = "focus down";
              "${modifier}+l" = "focus up";
              "${modifier}+semicolon" = "focus right";

              # move focused window
              "${modifier}+Shift+j" = "move left";
              "${modifier}+Shift+k" = "move down";
              "${modifier}+Shift+l" = "move up";
              "${modifier}+Shift+semicolon" = "move right";

              # split in horizontal/vertical orientation
              "${modifier}+h" = "split h";
              "${modifier}+v" = "split v";

              # enter fullscreen mode for the focused container
              "${modifier}+f" = "fullscreen toggle";

              # switch to workspace
              "${modifier}+1" = "workspace number ${services.polybar.config.vars.ws1}";
              "${modifier}+2" = "workspace number ${services.polybar.config.vars.ws2}";
              "${modifier}+3" = "workspace number ${services.polybar.config.vars.ws3}";
              "${modifier}+4" = "workspace number ${services.polybar.config.vars.ws4}";
              "${modifier}+5" = "workspace number ${services.polybar.config.vars.ws5}";
              "${modifier}+6" = "workspace number ${services.polybar.config.vars.ws6}";
              "${modifier}+7" = "workspace number ${services.polybar.config.vars.ws7}";
              "${modifier}+8" = "workspace number ${services.polybar.config.vars.ws8}";
              "${modifier}+9" = "workspace number ${services.polybar.config.vars.ws9}";
              "${modifier}+0" = "workspace number ${services.polybar.config.vars.ws10}";

              # move focused container to workspace
              "${modifier}+Shift+1" = "move container to workspace number ${services.polybar.config.vars.ws1}";
              "${modifier}+Shift+2" = "move container to workspace number ${services.polybar.config.vars.ws2}";
              "${modifier}+Shift+3" = "move container to workspace number ${services.polybar.config.vars.ws3}";
              "${modifier}+Shift+4" = "move container to workspace number ${services.polybar.config.vars.ws4}";
              "${modifier}+Shift+5" = "move container to workspace number ${services.polybar.config.vars.ws5}";
              "${modifier}+Shift+6" = "move container to workspace number ${services.polybar.config.vars.ws6}";
              "${modifier}+Shift+7" = "move container to workspace number ${services.polybar.config.vars.ws7}";
              "${modifier}+Shift+8" = "move container to workspace number ${services.polybar.config.vars.ws8}";
              "${modifier}+Shift+9" = "move container to workspace number ${services.polybar.config.vars.ws9}";
              "${modifier}+Shift+0" = "move container to workspace number ${services.polybar.config.vars.ws10}";
            };

            startup = [
              { command = "VBoxClient-all"; notification = false; }
              { command = "xrandr --output VGA-1 --dpi 160"; notification = false; }
              # { command = "compton --active-opacity 0.75 --inactive-opacity 0.3 --inactive-dim 0.8 --shadow --fading --blur-background"; notification = false; }
              { command = "feh --bg-center ~/wallpaper/yuyuko-4k.png --bg-center ~/wallpaper/utsuho-uhd.png"; notification = false; }
              { command = "polybar --reload top1"; always = true; notification = false; }
              { command = "polybar --reload top2"; always = true; notification = false; }
              { command = "polybar --reload bot1"; always = true; notification = false; }
              { command = "polybar --reload bot2"; always = true; notification = false; }
            ];
            
            fonts = [
              "Sarasa Gothic SC 10"
            ];

            floating = {
              modifier = "${modifier}";
            };

            gaps = {
              inner = 20;
              outer = 10;
            };

            bars = [];

          };
        };
      };
  
      services = {
        polybar = {
          enable = true;
          package = pkgs.polybarFull;
          script =  "polybar top1 &";

          config = rec {
            vars = {
              ws1 = "1:yuyuko";
              ws2 = "2:youmu";
              ws3 = "3:himemiko";
              ws4 = "4:VIVIT";
              ws5 = "5:C23";
              ws6 = "6";
              ws7 = "7";
              ws8 = "8";
              ws9 = "9";
              ws10 = "10";
            };

            colors = {
              foreground = "#323232";
              background = "#ffe9f9";

              yukari = "#710482";
              ran = "#eba61c";
              yuyuko = "#64bdf5";
              youmu = "#188c8c";
              chen = "#cf1313";
            };

            "bar/top1" = prebar // vga1 // top;
            "bar/top2" = prebar // vga2 // top;
            "bar/bot1" = prebar // vga1 // bot;
            "bar/bot2" = prebar // vga2 // bot;

            vga1 = {
              monitor = "VGA-1";
              font-0 = "Sarasa Gothic SC:size=16:weight=bold;1";
              font-1 = "Terminess Powerline:size=18:weight=bold;3";
              font-2 = "Iosevka Term:size=24:weight=bold;3";
              font-3 = "Sarasa Gothic SC:size=16:weight=bold;3";
            };

            vga2 = {
              monitor = "VGA-2";
              font-0 = "Sarasa Gothic SC:size=8:weight=bold;0";
              font-1 = "Terminess Powerline:size=10:weight=bold;2";
              font-2 = "Iosevka Term:size=16:weight=bold;2";
              font-3 = "Sarasa Gothic SC:size=10:weight=bold;2";
            };

            top = {
              modules-left = "menu-poweroff";
              modules-center = "title";
              modules-right = "eth-speed ram cpu date time";
            };

            bot = {
              modules-left = "i3";
              modules-right = "eth fs";
              tray-position = "left";
              bottom = true;

              scroll-up = "i3wm-wsnext";
              scroll-down = "i3wm-wsprev";
            };

            prebar = {
              width = "100%";
              height = "2%";
              radius = 5;

              background = "${colors.background}";
              foreground = "${colors.foreground}";

              line-size = 6;
              border-size = 1;
              border-color = "${colors.foreground}";

              padding = 3;
              module-margin = 2;

              locale = "zh_CN.UTF-8"; # TODO
            };

            "module/date" = {
              type = "internal/date";
              interval = 1;
              date = " %Y-%m-%d";
              label = "%date%";
              format-prefix = " ";
              format-underline = "${colors.ran}";
            };

            "module/time" = {
              type = "internal/date";
              interval = 1;
              time = "%H:%M";
              label = "%time%";
              format-prefix = " ";
              format-underline = "${colors.yukari}";
            };

            "module/title" = {
              type = "internal/xwindow";
              label = "%title%";
              format = "<label>";
              format-font = 4;
            };

            "module/cpu" = {
              type = "internal/cpu";
              interval = "0.5";
              format = "<label>";
              label = "﬙ %percentage%%";
              # ramp-coreload-spacing = 1;
              # ramp-coreload-0 = "▁";
              # ramp-coreload-1 = "▂";
              # ramp-coreload-2 = "▃";
              # ramp-coreload-3 = "▄";
              # ramp-coreload-4 = "▅";
              # ramp-coreload-5 = "▆";
              # ramp-coreload-6 = "▇";
              # ramp-coreload-7 = "█";
              format-underline = "${colors.yuyuko}";
            };

            "module/ram" = {
              type = "internal/memory";
              interval = 3;
              format = "<label>";
              label = " %gb_free%/%gb_total%";
              format-underline = "${colors.youmu}";
            };

            "module/menu-poweroff" = {
              type = "custom/menu";
              "menu-0-0" = "Shutdown";
              "menu-0-0-exec" = "systemctl poweroff";
              "menu-0-1" = "Restart";
              "menu-0-1-exec" = "systemctl reboot";
              "menu-0-2" = "Hibernate";
              "menu-0-2-exec" = "systemctl hybrid-sleep";

              label-open = "";
              label-open-foreground = "#ff0000";
              label-close = "";
              label-close-foreground = "#882222";
              label-separator = "|";
            };

            "module/fs" = {
              type = "internal/fs";

              mount-0 = "/";
              interval = 30;

              format-mounted = "<label-mounted>";
              format-unmounted = "<label-unmounted>";
              label-mounted = " %free%/%total%";
            };

            "module/eth" = {
              type = "internal/network";
              interface = "enp0s3";
              interval = 2;
              ping-interval = 2;

              format-connected = "<label-connected>";
              format-disconnected = "<label-disconnected>";
              format-packetloss = "<label-connected>";

              label-connected = " %ifname% %local_ip%  (%linkspeed%)";
              label-disconnected = "%ifname: not connected";
            };

            "module/eth-speed" = {
              type = "internal/network";
              interface = "enp0s3";
              interval = "0.5";
              ping-interval = 1;

              format-connected = "<label-connected>";
              format-disconnected = "";
              format-packetloss = "";
              label-connected = " %downspeed%   %upspeed%";
              format-connected-underline = "${colors.chen}";
            };

            # TODO: BUGFIX
            "module/i3" = {
              type = "internal/i3";
              strip-wsnumbers = true;
              index-sort = true;
              
              ws-icon-0 = "1;ω";
              ws-icon-1 = "2;ε";
              ws-icon-2 = "3;Ω";
              ws-icon-3 = "4;ψ";
              ws-icon-4 = "5;Γ";
              ws-icon-default = "⊢";

              format = "<label-state> <label-mode>";

              label-mode = "%mode";

              label-focused = "%icon% %name%";
              label-unfocused = "%icon%";
              label-visible = "%icon%";
              label-urgent = "%icon%";
              label-separator = "|";
            };
          };
        };
  
        compton.enable = true;
      };
    };
}
