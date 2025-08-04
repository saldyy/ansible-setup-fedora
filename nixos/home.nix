{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  users.defaultUserShell = pkgs.zsh;
  users.users.saldyy = {
    isNormalUser = true;
    packages = with pkgs; [
      pkgs.brave
      pkgs.zplug
    ];

    shell = pkgs.zsh;
  };
  
  programs.git = {
    enable = true;
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
