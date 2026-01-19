{ pkgs, ... }:

{
  flake.homeManagerModules.fonts = {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.symbols-only
    ];
  };
}
