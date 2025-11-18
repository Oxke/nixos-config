{ lib, ... }:
{
  imports = [
    ./plugins.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;

    globals.mapleader = ",";
    opts = import ./opts.nix;
    keymaps = import ./keymaps.nix;
    autoCmd = import ./autocmds.nix;

    colorschemes.oxocarbon.enable = true;

    extraConfigLua = lib.fileContents ./extraConfigLua.lua;
  };
}
