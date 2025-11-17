{ lib, ... }:
{
  programs.nixvim = {
    enable = true;
    defaulteditor = true;
    vimdiffalias = true;

    globals.mapleader = ",";
    opts = import ./opts.nix;
    keymaps = import ./keymaps.nix;

    colorschemes.oxocarbon.enable = true;

    plugins = import ./plugins.nix;
    # extraconfiglua = lib.filecontents /home/oxke/.config/nvim/init.lua.bak;
  };
}
