{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sddm-theme = {
      url = "github:catppuccin/where-is-my-sddm-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      sddm-theme,
      catppuccin,
      nixvim,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/laptop/configuration.nix
            ./nixosModules/sddm.nix
            ./nixosModules/vm.nix
            # inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p1
            inputs.home-manager.nixosModules.default
            (
              { ... }:
              {
                nixpkgs.overlays = [ sddm-theme.overlays.default ];
              }
            )
            {
              home-manager.users.thijs = {
                imports = [
                  catppuccin.homeModules.catppuccin
                  nixvim.homeManagerModules.nixvim
                ];
              };
            }
          ];
        };
      };
      homeManagerModules.default = ./homeManagerModules;
    };
}
