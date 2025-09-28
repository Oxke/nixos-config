{ lib, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;

    globals.mapleader = ",";
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>m";
        action = "<cmd>w<cr>";
      }
    ];

    colorschemes.oxocarbon.enable = true;
    plugins.lualine.enable = true;

    extraConfigLua = lib.fileContents /home/oxke/.config/nvim/init.lua.bak;
  };
}
