{ config, pkgs, ... }:

{
  imports = [
    ./modules    
  ];

  home-manager.users.saldyy = {
    home.stateVersion = "25.05";
  };


  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    plugins = {
      nvim-surround.enable = true;
    };

    extraConfigLua = ''
      vim.opt.relativenumber = true
      vim.opt.relativenumber = true
      vim.opt.number = true
      
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      
      vim.autoindent = true
      vim.smartindent = true
      
      vim.opt.autoread = true
      
      vim.opt.wrap = true
      vim.opt.textwidth = 100
      
      vim.opt.clipboard = 'unnamedplus'
      vim.opt.incsearch = false
      vim.opt.hlsearch = false
      
      vim.cmd([[
        augroup highlight_yank
            autocmd!
            au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=100 }
        augroup END
      ]])
    '';

    colorschemes = {
      onedark = {
        enable = true;
        settings = {
          style = "darker";
        };
      };
    };
  };
  
  programs.git = {
    enable = true;
    config = {
      user.name = "Phillip Nguyen";
      user.email = "png9981@gmail.com";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch";
    };
    # shellInit = ''
    #   source $HOME/.oh-my-zsh/themes/dracula.zsh-theme;
    # '';

    ohMyZsh = { 
      enable = true;
      plugins = [
        "git"
      ];
      theme = "dracula";
      custom = "$HOME/.oh-my-zsh";
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSOR = "1";
    NIXOS_OZONE_WL = "1";
  };
}
