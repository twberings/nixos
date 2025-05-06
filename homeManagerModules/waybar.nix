{
  config,
  lib,
  ...
}:

{
  options = {
    waybar.enable = lib.mkEnableOption "enables waybar";
  };

  config = lib.mkIf config.waybar.enable {
    catppuccin.waybar.enable = true;
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          modules-left = [
            "custom/powermenu"
            "hyprland/window"
          ];
          modules-center = [ "hyprland/workspaces" ];
          modules-right = [
            "clock"
            "battery"
          ];
          "custom/powermenu" = {
            format = "";
          };
          "hyprland/workspaces" = {
            format = "{icon}";
            format-icons = {
              active = "";
              default = "";
              urgent = "";
            };
          };
          "hyprland/window" = {
            rewrite = {
              "(.*) — Mozilla Firefox" = "󰈹  $1";
              "zsh" = "";
              "wezterm" = "";
              "nvim" = " NeoVim";
            };
          };
          "battery" = {
            format = "{icon}";
            states = {
              "warning" = 30;
            };
            tooltip-format = "{capacity}%";
            format-charging = "󱐋{icon}";
            format-icons = [
              "󰂎"
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };
        };
      };
      style = ''
        				* {
        					font-family: JetBrainsMono Nerd Font;
        					font-size: 15px;
        				}
        				
        				window#waybar {
        					background-color: transparent;
        				}

        				window#waybar.solo {
        					transition: background .3s;
        					background: @base;
        				}

        				#workspaces {
        					margin: 3px;
        					background-color: @surface0;
        					border-radius: 1rem;
        					border-style: solid;
        					border-color: @lavender;
        					border-width: 2px;
        				}

        				#battery {
        					font-size: 20px;
        					margin: 3px;
        					color: @blue;
        					padding: 5px;
        					padding-left: 12px;
        					padding-right: 12px;
        					background-color: @surface0;
        					border-radius: 1rem;
        					border-style: solid;
        					border-color: @blue;
        					border-width: 2px;
        				}

        				#battery.charging {
        					color: @green;
        					border-color: @green;
        					padding-left: 10px;
        				}

        				#battery.warning:not(.charging) {
        					color: @red;
        					border-color: @red;
        				}

        				#clock {
        					margin: 3px;
        					padding: 5px;
        					color: @yellow;
        					background-color: @surface0;
        					border-radius: 1rem;
        					border-style: solid;
        					border-color: @yellow;
        					border-width: 2px;
        				}
        				
        				#custom-powermenu {
        					font-size: 20px;
        					color: @sky;
        					margin: 3px;
        					padding: 5px;
        					padding-left: 8px;
        					padding-right: 8px;
        					background-color: @surface0;
        					border-radius: 1rem;
        					border-style: solid;
        					border-color: @sky;
        					border-width: 2px;
        				}

        				#window {
        					color: @mauve;
        					margin: 3px;
        					padding: 5px;
        					padding-left: 8px;
        					padding-right: 8px;
        					background-color: @surface0;
        					border-radius: 1rem;
        					border-style: solid;
        					border-color: @mauve;
        					border-width: 2px;
        				}

        				window#waybar.empty #window {
        					background-color: transparent;
        					border-color: transparent;
        				}

        				#workspaces button {
        					border-radius: 1rem;
        					color: @lavender;
        				}

        				#workspaces button.active {
        					color: @green;
        				}

        				#workspaces button.urgent {
        					color: @red;
        				}
        			'';
    };
  };
}
