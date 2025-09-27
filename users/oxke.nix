{ config, pkgs, ... }:
{
  users.users.oxke = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree wl-clipboard-rs slurp swaybg mako
      fastfetch bitwarden-desktop bitwarden-cli
      libreoffice zathura jq
    ];
  };
  home-manager = {
      backupFileExtension = "bak";
      useGlobalPkgs = true;
      users.oxke = import ./home.oxke.nix;
  };
}
