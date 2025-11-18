{ lib, ... }:
{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        options = import ./opts.nix;
        theme = {
          enable = true;
          name = "oxocarbon";
          style = "dark";
        };
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.blink-cmp = {
          enable = true;
          friendly-snippets.enable = true;
          setupOpts.keymap.preset = "super-tab";
        };
        
        lsp.enable = true;
        languages = {
          enableTreesitter = true;

          nix.enable = true;
          ts.enable = true;
          rust.enable = true;
          python.enable = true;
          lua.enable = true;
          julia.enable = true;
        };
      };
    };
  };
}
