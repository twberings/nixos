{ config, pkgs, ... }:

{
  home.username = "thijs";
  home.homeDirectory = "/home/thijs";
  home.stateVersion = "24.11"; 

  home.packages = [
    pkgs.xfce.thunar
    pkgs.lazygit
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
  
  programs.wezterm = {
	  enable = true;
  };

  programs.git = {
	enable = true;
	userEmail = "twberings@gmail.com";
	userName = "Thijs Berings";
	extraConfig = {
		init.defaultBranch = "main";
	};
  };

  hyprland.enable = false;

  

}
