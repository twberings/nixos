{
  config,
  lib,
  ...
}:

{
  options = {
    starship.enable = lib.mkEnableOption "enables starship";
  };

  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {

        "$schema" = "https://starship.rs/config-schema.json";
        format = lib.concatStrings [
          "[](surface0)"
          "$nix_shell"
          "[](bg:peach fg:surface0)"
          "$directory"
          "[](fg:peach bg:green)"
          "$git_branch"
          "$git_status"
          "[](fg:green bg:blue)"
          "$c"
          "$rust"
          "$golang"
          "$nodejs"
          "$php"
          "$java"
          "$kotlin"
          "$haskell"
          "$python"
          "[](fg:blue bg:purple)"
          "$time"
          "[ ](fg:purple)"
          "$line_break$character"
        ];
        palette = "catppuccin_mocha";

        palettes.catppuccin_mocha = {
          rosewater = "#f5e0dc";
          flamingo = "#f2cdcd";
          pink = "#f5c2e7";
          orange = "#cba6f7";
          red = "#f38ba8";
          maroon = "#eba0ac";
          peach = "#fab387";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          teal = "#94e2d5";
          sky = "#89dceb";
          sapphire = "#74c7ec";
          blue = "#89b4fa";
          lavender = "#b4befe";
          text = "#cdd6f4";
          subtext1 = "#bac2de";
          subtext0 = "#a6adc8";
          overlay2 = "#9399b2";
          overlay1 = "#7f849c";
          overlay0 = "#6c7086";
          surface2 = "#585b70";
          surface1 = "#45475a";
          surface0 = "#313244";
          base = "#1e1e2e";
          mantle = "#181825";
          crust = "#11111b";
        };

        os = {
          disabled = false;
          style = "bg:surface0 fg:text";
          symbols.NixOS = "󱄅  ";
        };

        nix_shell = {
          format = "[$symbol]($style)";
          symbol = "󱄅 ";
          style = "bg:surface0 fg:sky";
        };

        directory = {
          style = "fg:mantle bg:peach";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";

          substitutions = {
            "Documents" = "󰈙 ";
            "Downloads" = " ";
            "Music" = "󰝚 ";
            "Pictures" = " ";
            "Developer" = "󰲋 ";
          };
        };

        git_branch = {
          symbol = "";
          style = "bg:blue";
          format = "[[ $symbol $branch ](fg:base bg:green)]($style)";
        };

        git_status = {
          style = "bg:blue";
          format = "[[($all_status$ahead_behind )](fg:base bg:green)]($style)";
        };
        nodejs = {
          symbol = "";
          style = "bg:blue";
          format = "[[ $symbol( $version) ](fg:base bg:blue)]($style)";
        };

        c = {
          symbol = " ";
          style = "bg:blue";
          format = "[[ $symbol( $version) ](fg:base bg:blue)]($style)";
        };

        rust = {
          symbol = "";
          style = "bg:blue";
          format = "[[ $symbol( $version) ](fg:base bg:blue)]($style)";
        };

        golang = {
          symbol = "";
          style = "bg:blue";
          format = "[[ $symbol( $version) ](fg:base bg:blue)]($style)";
        };

        php = {
          symbol = "";
          style = "bg:blue";
          format = "[[ $symbol( $version) ](fg:color_fg0 bg:blue)]($style)";
        };

        java = {
          symbol = " ";
          style = "bg:blue";
          format = "[[ $symbol( $version) ](fg:color_fg0 bg:blue)]($style)";
        };

        kotlin = {
          symbol = "";
          style = "bg:blue";
          format = "[[ $symbol( $version) ](fg:color_fg0 bg:blue)]($style)";
        };

        haskell = {
          symbol = "";
          style = "bg:blue";
          format = "[[ $symbol( $version) ](fg:color_fg0 bg:blue)]($style)";
        };

        python = {
          symbol = "";
          style = "bg:blue";
          format = "[[ $symbol( $version) ](fg:color_fg0 bg:blue)]($style)";
        };

        time = {
          disabled = false;
          time_format = "%R";
          style = "bg:peach";
          format = "[[  $time ](fg:mantle bg:purple)]($style)";
        };

        line_break = {
          disabled = false;
        };

        character = {
          disabled = false;
          success_symbol = "[](bold fg:green)";
          error_symbol = "[](bold fg:red)";
          vimcmd_symbol = "[](bold fg:creen)";
          vimcmd_replace_one_symbol = "[](bold fg:purple)";
          vimcmd_replace_symbol = "[](bold fg:purple)";
          vimcmd_visual_symbol = "[](bold fg:lavender)";
        };
      };
    };
  };
}
