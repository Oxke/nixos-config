{ config, pkgs, lib, ... }:
{
  services.printing.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "vscode-extension-github-copilot"
      "vscode-extension-ms-vscode-cpptools"
      "vscode-extension-MS-python-vscode-pylance"
      "vscode-extension-github-copilot-chat"
      "vscode" "steam" "steam-original"
      "steam-unwrapped" "steam-run"
      "discord-canary" "webex"
    ];
}
