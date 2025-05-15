{ lib, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";

    diagnostic.settings = {
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
        key = "<leader>sv";
        action = "<CMD>vsplit<CR>";
      }
      {
        mode = "n";
        key = "<leader>sh";
        action = "<CMD>split<CR>";
      }
      {
        mode = "n";
        key = "<leader>gf";
        action.__raw = "vim.lsp.buf.format";
      }
      {
        mode = "n";
        key = "<leader>h";
        action = "<CMD>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>";
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
      rustaceanvim = {
        enable = true;
        settings.tools.enable_clippy = true;
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
                score_offset = -1;
              };
            };
          };

        };
      };

      oil.enable = true;
      lualine.enable = true;
      todo-comments.enable = true;
      nvim-autopairs.enable = true;
      tmux-navigator.enable = true;
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };
      gitsigns.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader><leader>" = "oldfiles";
        };
        extensions.ui-select.enable = true;
      };
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
