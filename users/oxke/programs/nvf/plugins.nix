{ pkgs, ... }:
{
  programs.nixvim = { 
    plugins = {
      # vimtex.enable = true;
      lualine.enable = true;
      treesitter.enable = true;
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
