{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
  };
  boot.supportedFilesystems = [ "ntfs" ];

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

  # fileSystems."/mnt/windows" = {
  #   device = "/dev/disk/by-id/nvme-eui.0025385b01410a9c";
  #   fsType = "ntfs-3g";
  #   options = [
  #     "rw"
  #     "uid=1000"
  #   ];
  # };
  security.polkit.enable = true;
  security.soteria.enable = true;

  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-label/Games";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
    ];
  };

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
        command = "Hyprland";
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

  programs.steam.enable = true;
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
  ];
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs; [
    thunar-archive-plugin
    thunar-volman
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "thijs" = {
        imports = [
          ./home.nix
          inputs.self.outputs.homeManagerModules.default
        ];
      };
    };
  };
  system.stateVersion = "24.11";

}
