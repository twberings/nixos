{ config, lib, pkgs, ... }:

{
	options = {
		hyprland.enable = lib.mkEnableOption "enables hyprland";
	};

	config = lib.mkIf config.hyprland.enable {
		
	};
}
