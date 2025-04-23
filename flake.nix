{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
    	url = "github:nix-community/home-manager";
    	inputs.nixpkgs.follows = "nixpkgs";
    };

    sddm-theme = {
	url = "github:catppuccin/where-is-my-sddm-theme";
    	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, sddm-theme, ... }@inputs: {
    nixosConfigurations = {
    	nixos = nixpkgs.lib.nixosSystem {
		specialArgs = {inherit inputs;};
		modules = [
			./hosts/laptop/configuration.nix
			./nixosModules/sddm.nix
			inputs.home-manager.nixosModules.default
			({pkgs, ...}: {
				nixpkgs.overlays = [sddm-theme.overlays.default];
			})
		];
	};
    };
    homeManagerModules.default = ./homeManagerModules;
  };
}
