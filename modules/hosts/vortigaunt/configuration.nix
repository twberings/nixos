{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.vortigaunt = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hostVortigaunt
    ];
  };

  flake.nixosModules.hostVortigaunt =
    { pkgs, ... }:
    {
      imports = [
        inputs.home-manager.nixosModules.default
        inputs.disko.nixosModules.disko
        self.diskoConfigurations.hostVortigaunt
      ];

      home-manager = {
        users = {
          thijs = {
            imports = [
              self.homeConfigurations.hostVortigaunt
              self.homeModules.nixvim
              self.homeModules.hyprland
              self.homeModules.fonts
              self.homeModules.starship
              self.homeModules.tmux
              self.homeModules.waybar
              self.homeModules.wezterm
              inputs.catppuccin.homeModules.catppuccin
              inputs.nixvim.homeModules.nixvim
              inputs.stylix.homeModules.stylix
            ];
          };
        };
      };

      boot = {
        loader.systemd-boot.enable = false;
        loader.efi.canTouchEfiVariables = true;
        loader.efi.efiSysMountPoint = "/boot";
        loader.grub = {
          enable = true;
          device = "nodev";
          useOSProber = true;
          efiSupport = true;
        };
        supportedFilesystems = [ "ntfs" ];
        kernelParams = [ "quiet" ];
      };

      hardware.graphics.enable = true;
      hardware.graphics.extraPackages = with pkgs; [
        vulkan-loader
        vulkan-validation-layers
        vulkan-extension-layer
      ];
      hardware.nvidia.open = true;
      services.xserver.videoDrivers = [ "nvidia" ];

      networking.hostName = "nixos";
      networking.networkmanager.enable = true;

      security.polkit.enable = true;
      security.soteria.enable = true;

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      time.timeZone = "Europe/Amsterdam";

      i18n.defaultLocale = "en_US.UTF-8";
      console = {
        font = "Lat2-Terminus16";
        useXkbConfig = true;
      };

      nixpkgs.config.allowUnfree = true;

      services.printing.enable = true;

      services.pipewire = {
        enable = true;
        pulse.enable = true;
      };

      services.libinput.enable = true;

      services.getty.autologinUser = "thijs";
      services.greetd = {
        enable = true;
        settings = rec {
          initial_session = {
            command = "start-hyprland";
            user = "thijs";
          };
          default_session = initial_session;
        };
      };

      users.users.thijs = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "dialout"
        ];
        shell = pkgs.zsh;
      };

      hardware.flipperzero.enable = true;

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

      hardware.logitech.wireless.enable = true;

      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
        extraPackages = with pkgs; [
          gamescope
          SDL2
          er-patcher
        ];
        protontricks.enable = true;
        gamescopeSession.enable = true;
      };
      programs.gamemode.enable = true;

      programs.gamescope = {
        enable = true;
        capSysNice = false;
      };

      environment.systemPackages = with pkgs; [
        thunar
        file-roller
        neovim
        solaar
        discord
        vulkan-tools
        wget
        quickshell
        thunar-archive-plugin
        thunar-volman
        gamescope-wsi
        gamescope
        steam-run
        archipelago
      ];
      services.gvfs.enable = true;
      services.tumbler.enable = true;

      programs.xfconf.enable = true;
      programs.thunar.plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
      ];

      system.stateVersion = "24.11";

    };
}
