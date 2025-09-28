{ config, lib, pkgs, inputs, ... }:
{
  imports= [
    inputs.nixvim.homeModules.nixvim
    ./programs
  ];
  
  home.packages = with pkgs; [
    floorp-bin
    fzf rofi atool fyi
    urlscan httpie pup tailscale
    kitty lolcat sl cowsay
    waybar i3status
    nerd-fonts.caskaydia-cove fira-code
    texliveFull luarocks
    bitwarden-menu
    mutt discord-canary nchat
    gccgo R octaveFull
    ollama
    dict
    vim
  ];

  home.stateVersion = "25.05";
}
