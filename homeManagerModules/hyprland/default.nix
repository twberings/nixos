{
  config,
  lib,
  ...
}:

{
  options = {
    hyprland.enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;

      settings = {

        monitor = ",highres, auto, 1";
        env = "XCURSOR_SIZE,24";

        misc = {
          disable_splash_rendering = true;
          disable_hyprland_logo = true;
        };

        input = {
          kb_options = "ctrl:nocaps";
          follow_mouse = 1;

          touchpad = {
            natural_scroll = true;
          };

          sensitivity = 0;
        };

        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          "col.active_border" = "rgba(a6e3a1ff)";
          "col.inactive_border" = "rgba(1e1e2eff)";
          layout = "dwindle";
        };

        decoration = {
          rounding = 10;
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
          };
        };

        animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
            "specialWorkspace, 1, 6, default, slidevert"
          ];
        };

        gestures = {
          workspace_swipe = true;
        };

        "$mainMod" = "SUPER";

        "$browser" = "firefox";
        "$term" = "wezterm";
        "$explorer" = "thunar";
        "$apprunner" = "tofi-drun --drun-launch=true";

        bind = [
          "$mainMod, B, exec, $browser"
          "$mainMod SHIFT, B, exec, $browser -private-window"
          "$mainMod, Space, exec, $apprunner"
          "$mainMod, Return, exec, $term"
          "$mainMod, T, exec, $term"
          "$mainMod, W, killactive"
          "$mainMod, E, exec, $explorer"
          "$mainMod, F, togglefloating"
          "$mainMod SHIFT, F, fullscreen"

          "$mainMod, H, movefocus, l"
          "$mainMod, J, movefocus, d"
          "$mainMod, K, movefocus, u"
          "$mainMod, L, movefocus, r"

          "$mainMod, left, resizeactive, -40 0"
          "$mainMod, down, resizeactive, 0 40"
          "$mainMod, up, resizeactive, 0 -40"
          "$mainMod, right, resizeactive, 40 0"

          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"

          "$mainMod, Tab, workspace, e+1"
          "$mainMod SHIFT, Tab, workspace, e-1"
        ];
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        windowrulev2 = [
          "noborder, focus:0"
          "bordersize 0, floating:0, onworkspace:w[tv1]"
          "rounding 0, floating:0, onworkspace:w[tv1]"
          "bordersize 0, floating:0, onworkspace:f[1]"
          "rounding 0, floating:0, onworkspace:f[1]"
        ];

        workspace = [
          "w[tv1], gapsout:0, gapsin:0"
          "f[1], gapsout:0, gapsin:0"
        ];
      };
    };
    home.file = {
      ".config/hypr/wallpapers/0.png".source = ./wallpapers/0.png;
    };
    services.hyprpaper = {
      enable = true;
      settings = {
        splash = false;
        preload = [ "$HOME/.config/hypr/wallpapers/0.png" ];
        wallpaper = ",$HOME/.config/hypr/wallpapers/0.png";
      };
    };
  };
}
