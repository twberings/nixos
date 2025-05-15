{ config, pkgs, ... }:

{
  home.username = "thijs";
  home.homeDirectory = "/home/thijs";
  home.stateVersion = "24.11";

  home.packages = [
    pkgs.xfce.thunar
    pkgs.lazygit
    pkgs.networkmanager_dmenu
    pkgs.networkmanagerapplet
    pkgs.ripgrep
  ];

  home.file = {
  };

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
      strategy = [ "history" ];
    };
    shellAliases = {
      nd = "nix develop -c $SHELL";
    };
  };

  programs.git = {
    enable = true;
    userEmail = "twberings@gmail.com";
    userName = "Thijs Berings";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  hyprland.enable = true;
  wezterm.enable = true;
  starship.enable = true;
  waybar.enable = true;
  programs.tofi = {
    enable = true;
    settings = {
      width = "100%";
      height = "100%";
      border-width = 0;
      outline-width = 0;
      font = "monospace";
      padding-left = "35%";
      padding-top = "35%";
      result-spacing = 25;
      num-results = 5;
    };
  };

  xdg = {
    enable = true;
    configFile."networkmanager-dmenu/config.ini".text = ''
      		[dmenu]
      		dmenu_command = tofi
      	'';
  };

  catppuccin.flavor = "mocha";
  catppuccin.accent = "green";
  catppuccin.tofi.enable = true;

  gtk.enable = true;
  qt.enable = true;
  catppuccin.gtk.enable = true;
  catppuccin.cursors.enable = true;
  catppuccin.gtk.icon.enable = true;

}
