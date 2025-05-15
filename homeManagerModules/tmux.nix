{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    tmux.enable = lib.mkEnableOption "enables tmux";
  };

  config = lib.mkIf config.wezterm.enable {
    programs.tmux = {
      enable = true;
      plugins = [ 
        pkgs.tmuxPlugins.catppuccin
        pkgs.tmuxPlugins.vim-tmux-navigator
      ];
    };
  };
}
