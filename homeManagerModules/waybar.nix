{ config, lib, pkgs, ... }:

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
					modules-left = ["hyprland/window"];
					modules-center = ["hyprland/workspaces"];
					modules-right = [
						"battery"
						"clock"
					];
				};
			};
			style = ''
				* {
					font-family: JetBrainsMono Nerd Font;
				}
				
				window#waybar {
					background-color: transparent;
				}

				window#waybar.solo {
					background: @base;
					transition: background .3s;
				}

				.modules-center {
					color: @green;
				}
			'';
		};
	};
}
