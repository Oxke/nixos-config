{ config, pkgs, ... }:
{
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;
      START_CHARGE_THRESH_BAT0 = 70;
      STOP_CHARGE_THRESH_BAT0 = 80;
      START_CHARGE_THRESH_BAT1 = 70;
      STOP_CHARGE_THRESH_BAT1 = 80;
    };
  };

  services.logind.settings.Login = {
    HandlePowerKey = "poweroff";
    HandleLidSwitch = "suspend";
  };

  zramSwap.enable = true;
}
