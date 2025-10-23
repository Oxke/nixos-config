{ config, pkgs, inputs, ... }:
{
  users.users.oxke = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree wl-clipboard-rs slurp swaybg swaylock mako wl-mirror
      fastfetch bitwarden-desktop bitwarden-cli
      libreoffice zathura jq
    ];
  };
  home-manager = {
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users.oxke = import ./home.nix;
  };
}
