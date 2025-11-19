{ pkgs, ... }:
{
  programs.nixvim = { 
    plugins = {
      vimtex.enable = true;
      lz-n.enable = true;
      lualine.enable = true;
      treesitter.enable = true;
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          ts_ls.enable = true;
          lua_ls.enable = true;
          ltex.enable = true;
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
      friendly-snippets.enable = true;
      tiny-inline-diagnostic.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<C-p>" = {
            action = "git_files";
            options = {
              desc = "Telescope Git Files";
            };
          };
          "<leader>fg" = {
            action = "live_grep";
            options = {
              desc = "Telescope Live Grep";
            };
          };
          "<leader>ff" = {
            action = "find_files";
            options = {
              desc = "Telescope Find Files";
            };
          };
          "<leader>fb" = {
            action = "buffers";
            options = {
              desc = "Telescope Find Buffers";
            };
          };
        };
      };
      web-devicons.enable = true;
      mini = {
        enable = true;
        modules = import ./mini-modules.nix;
      };
    };
    extraPlugins = let vp = pkgs.vimPlugins; in [
      vp.ultisnips
    ];
  };
}
