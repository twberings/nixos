{ config, lib, pkgs, ... }:

{
	options = {
		waybar.enable = lib.mkEnableOption "enables waybar"
	};

	config = lib.mkIf config.waybar.enable {
		catppuccin.waybar.enable = true;
		programs.waybar = {
			enable = true;
			systemd.enable = true;
			settings = {
				layer = "top";
				position = "top";
				modules-left = ["hyprland/workspaces"];
				modules-center = ["clock"];
				modules-right = [""];
			};
		};
	};
}
