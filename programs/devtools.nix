{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget git tmux lynx
    fwupd brightnessctl powertop
    pinentry-tty pinentry-rofi
    usbutils fw-ectool python313
    lm_sensors
    linuxKernel.packages.linux_zen.cpupower
  ];
}
