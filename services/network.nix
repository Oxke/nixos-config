{ config, pkgs, ... }:
{
  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    networks = {
      "Fracchia Family".psk = "frakkyafamili1!1!";
      "hello".psk = "aaaaaaaa";
      "EDISU - VOLTA".psk = null;
      "FW-GUEST".psk = null;
      "EmiliaRomagnaWiFi wifiprivacy.it".psk = null;
      "Mi 10T Lite".psk = "DioCane42!";
      eduroam = {
        auth = ''
          key_mgmt=WPA-EAP
          eap=PEAP
          phase2="auth=MSCHAPV2"
          identity="FRCSOE04E19D205V@unipv.it"
          password="X204882M"
          ca_cert="/etc/ssl/certs/ca-bundle.crt"
        '';
      };
    };
  };

  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  services.resolved.enable = true;
  services.openssh.enable = true;
  services.tailscale.enable = true;
}
