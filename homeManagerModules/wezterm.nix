{ config, lib, pkgs, ... }:

{
	options = {
		wezterm.enable = lib.mkEnableOption "enables wezterm";
	};

	config = lib.mkIf config.wezterm.enable {
		programs.wezterm = {
			enable = true;
			extraConfig = ''
				local wezterm = require("wezterm")

				return {
					enable_tab_bar = false,
					color_scheme = "Catppuccin Frappe",
					window_padding = {
						left = 0,
						right = 0,
						top = 0,
						bottom = 0,
					},
					window_background_opacity = 0.7,

				}
			''
		};
	};
}
