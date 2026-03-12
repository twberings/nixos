{
  flake.homeConfigurations.hostVortigaunt =
    {
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

      programs.home-manager = {
        enable = true;
      };

      services.dunst.enable = true;

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
        settings = {
          user = {
            email = "twberings@gmail.com";
            name = "Thijs Berings";
          };
          init.defaultBranch = "main";
        };
      };
      programs.gh = {
        enable = true;
        gitCredentialHelper.enable = true;
      };

      programs.hyprlock.enable = true;

      hyprland.enable = true;
      wayland.windowManager.hyprland.settings.monitor = [
        "DP-1, 2560x1440@239.76, 0x0, 1, bitdepth, 10, vrr, 1"
        "DP-3, 3840x2160, auto-left, 1.25"
        "desc:LG Electronics 27GL650F 007NTWGJ9953, 1920x1080@144.00101, auto-right, 1, transform, 1"
      ];
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

      stylix = {
        enable = true;
        targets = {
          nixvim.enable = false;
          hyprland.enable = false;
          starship.enable = false;
          waybar.enable = false;
          gtk.enable = true;
          qt.enable = true;
        };
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
      };

      catppuccin.cursors.enable = true;
      catppuccin.gtk.icon.enable = true;

    };
}
