{
  inputs,
  self,
  ...
}:

{
  flake.nixosConfigurations.headcrab = inputs.nixpkgs.lib.nixosSystem {
    modules = with self; [
      nixosModules.hostHeadcrab
      nixosModules.sddm
      (
        { ... }:
        {
          nixpkgs.overlays = [ inputs.sddm-theme.overlays.default ];
        }
      )
    ];
  };
  flake.nixosModules.hostHeadcrab =
    { pkgs, config, ... }:
    {

      imports = [
        inputs.home-manager.nixosModules.default
      ];

      home-manager = {
        users = {
          thijs = {
            imports = with self; [
              homeConfigurations.hostHeadcrab
              homeModules.nixvim
              homeModules.hyprland
              homeModules.hyprlandgestures
              homeModules.fonts
              homeModules.starship
              homeModules.tmux
              homeModules.wezterm
              inputs.catppuccin.homeModules.catppuccin
              inputs.nixvim.homeModules.nixvim
              inputs.stylix.homeModules.stylix
            ];
          };
        };
      };

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.kernelParams = [ "quiet" ];

      hardware.graphics.enable = true;

      services.xserver.videoDrivers = [ "nvidia" ];

      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        prime = {
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };

      networking.hostName = "nixos";
      networking.networkmanager.enable = true;

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      sddm.enable = true;
      boot.plymouth.enable = true;

      time.timeZone = "Europe/Amsterdam";

      i18n.defaultLocale = "en_US.UTF-8";
      console = {
        font = "Lat2-Terminus16";
        useXkbConfig = true;
      };

      nixpkgs.config.allowUnfree = true;

      services.printing.enable = true;
      hardware.bluetooth.enable = true;

      services.pipewire = {
        enable = true;
        pulse.enable = true;
      };

      services.libinput.enable = true;

      users.users.thijs = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "dialout"
          "eduroam"
        ];
        shell = pkgs.zsh;
      };

      qt.enable = true;
      programs.firefox.enable = true;
      programs.zsh.enable = true;
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
        wget
      ];

      system.stateVersion = "24.11";

    };
}
