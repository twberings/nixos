{ config, lib, pkgs, ... }:

{
	programs.nixvim = {
		enable = true;
		colorschemes.catppuccin.enable = true;
	};
}
