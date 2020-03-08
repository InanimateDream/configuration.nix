{ config, pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  programs.zsh =
    {
      enable = true;

      vteIntegration = true;
      enableCompletion = true;
      zsh-autoenv.enable = true;

      autosuggestions =
        {
          enable = true;
          strategy = "match_prev_cmd";
          highlightStyle = "fg=8";
        };

      syntaxHighlighting =
        {
          enable = true;
          highlighters = [ "main" "brackets" "pattern" ];
          patterns =
            {
              "rm -rf *" = "fg=white,bold,bg=red";
            };
          styles =
            {
              "alias" = "fg=cyan";
              "path" = "fg=magenta,bold";
            };
        };

      ohMyZsh =
        {
          enable = true;

          plugins =
            [
              "vi-mode"
              "man" "sudo" "systemd"
              "thefuck" "httpie"
              "yarn" "git" "rust"
              "pip" "python"
              "vscode"
              "encode64"
              "colorize"
              "colored-man-pages"
            ];

          customPkgs = with pkgs;
            [
              nix-zsh-completions
            ];
        };

      shellAliases =
        {
          ".." = "cd ..";
          ls = "lsd";
          lt = "lsd --tree";
          ltl = "lsd --tree -l";
          lta = "lsd --tree -a";
          ltal = "lsd --tree -al";
          make = "colormake";
          diff = "diff --color";
          nsfw = "sudo nixos-rebuild switch";
          neofetch = "neofetch | lolcat";
        };

      promptInit =
        ''
          source /etc/nixos/programs/p10k.zsh
          source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        '';
    };
}
