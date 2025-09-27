{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./suspend-then-hibernate.nix

    ./hosts/nixosea.nix
    ./users/oxke.nix
    ./services ./programs
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05"; # don’t change once set!
}
