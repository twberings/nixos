{ lib, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";

    diagnostic.config = {
      virtual_lines = {
        current_line = true;
      };
      virtual_text = true;
      update_in_insert = true;
    };

    opts = {
      number = true;
      relativenumber = true;
      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      scrolloff = 8;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>w";
        action = "<CMD>w<CR>";
      }
      {
        mode = "n";
        key = "<leader>q";
        action = "<CMD>q<CR>";
      }
      {
        mode = "n";
        key = "-";
        action = "<CMD>Oil<CR>";
      }
      {
        mode = "n";
        key = "<leader>gf";
        action.__raw = "vim.lsp.buf.format";
      }
    ];

    colorschemes.catppuccin.enable = true;
    clipboard.providers.wl-copy.enable = true;

    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          nixd = {
            enable = true;
            settings = {
              formatting = {
                command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
              };
            };
          };
        };
      };

      blink-emoji.enable = true;
      blink-cmp = {
        enable = true;
        settings = {
          sources = {
            default = [
              "lsp"
              "path"
              "buffer"
              "emoji"
            ];
            providers = {
              emoji = {
                name = "Emoji";
                module = "blink-emoji";
                score_offset = 1;
              };
            };
          };

        };
      };

      oil.enable = true;
      lualine.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
      web-devicons.enable = true;
      notify.enable = true;
      noice = {
        enable = true;
        settings = {
          presets = {
            bottom_search = true;
            command_palette = true;
          };
        };
      };
    };
  };
}
