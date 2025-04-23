{ config, lib, pkgs, ...}:

{
	options = {
		starship.enable = lib.mkEnableOption "enables starship";
	};

	config = lib.mkIf config.starship.enable {
		programs.starship.enable = true;
	};
}
