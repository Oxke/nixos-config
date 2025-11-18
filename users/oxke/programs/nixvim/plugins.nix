{ pkgs, ... }:
{
  programs.nixvim = { 
    plugins = {
      # vimtex.enable = true;
      # lz-n.enable = true;
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
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
      friendly-snippets.enable = true;
      telescope.enable = true;
      mini = {
        enable = true;
        modules = import ./mini-modules.nix;
        mockDevIcons = true;
      };
      lazy = {
        enable = true;
        plugins = let vp = pkgs.vimPlugins; in [
          {
            pkg = vp.ultisnips;
            event = ["InsertEnter"];
          }
          {
            pkg = vp.vimtex;
            ft = ["tex"];
          }
        ];
      };
    };
    # extraPlugins = let vp = pkgs.vimPlugins; in [
    #   vp.ultisnips
    # ];
  };
}
