{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.username = "thijs";
  home.homeDirectory = "/home/thijs";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    lazygit
    networkmanager_dmenu
    networkmanagerapplet
    ripgrep
    vlc
  ];

  home.file = {
  };


  programs.home-manager.enable = true;

  services.dunst.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
      strategy = [ "history" ];
    };
    shellAliases = {
      nd = "nix develop path:nix -c $SHELL";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "twberings@gmail.com";
        name = "Thijs Berings";
      };
      init.defaultBranch = "main";
    };
  };

  programs.hyprlock.enable = true;

  hyprland.enable = true;
  wezterm.enable = true;
  starship.enable = true;
  waybar.enable = true;
  programs.rofi = {
    enable = true;
    plugins = [
      pkgs.rofi-games
    ];
    modes = [
      "drun"
      "games"
    ];
    font = lib.mkForce "JetBrains Mono 14";
    extraConfig = {
      show-icons = true;
      display-drun = "";
      display-window = "";
      display-combi = "";
    };
  };

  catppuccin.flavor = "mocha";
  catppuccin.accent = "green";

  gtk.enable = true;
  qt.enable = true;

  stylix.enable = true;
  stylix.targets.nixvim.enable = false;
  stylix.targets.hyprland.enable = false;
  stylix.targets.starship.enable = false;
  stylix.targets.waybar.enable = false;
  stylix.targets.gtk.enable = true;
  stylix.targets.qt.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";

  catppuccin.cursors.enable = true;
  catppuccin.gtk.icon.enable = true;

}
