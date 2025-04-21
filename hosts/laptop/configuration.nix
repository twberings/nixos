{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;  

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.sddm.enable = true;
  boot.plymouth.enable = true;

  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.UTF-8";
   console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; 
  };

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  users.users.thijs = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  qt.enable = true;
  programs.firefox.enable = true;
  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
  };

  environment.sessionVariables = {
	WLR_NO_HARDWARE_CURSORS = "1";
	NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    neovim
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
  ];

  home-manager."thijs" = {
	extraSpecialArgs = { inherit inputs; };
	users = {
		modules = [
			./home.nix
			inputs.self.outputs.homeManagerModules.default
		];
	};
  };
  system.stateVersion = "24.11";

}

