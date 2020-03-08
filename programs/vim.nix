{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.vim;
in
  {
    options.vim =
      {
        user = mkOption { type = types.str; };
      };

    config =
      {
        programs.vim.defaultEditor = true;

        users.users.${cfg.user}.packages = with pkgs; [ python37Packages.powerline ];
        home-manager.users.${cfg.user}.programs.vim =
          {
            enable = true;
            settings =
              {
                tabstop = 4;
                number = true;
                copyindent = true;
              };
            plugins = with pkgs.vimPlugins; [ gist-vim ];
            extraConfig =
              ''
                let mapleader = ","
                map <space> /
                map <C-space> ?
                map <C-j> <C-W>j
                map <C-k> <C-W>k
                map <C-h> <C-W>h
                map <C-l> <C-W>l

                set ruler
                set autoread
                set hlsearch
                set smarttab
                set expandtab
                set encoding=utf8

                filetype plugin on
                filetype indent on

                syntax enable

                set rtp+=${pkgs.python37Packages.powerline}/lib/python3.7/site-packages/powerline/bindings/vim
              '';
          };
      };
  }
