{ config, pkgs, lib, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "usbcore.autosuspend=120"
      "mem_sleep_default=deep"
      "amd_pstate=active"
    ];
  };

  networking.hostName = "nixosea";
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = ./../oseacentos.map;
  };
}
