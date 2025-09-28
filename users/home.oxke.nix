{ config, lib, pkgs, inputs, ... }:
{
  imports= [
    inputs.nixvim.homeModules.nixvim
  ];
  
  home.packages = with pkgs; [
    atool
    httpie
    floorp-bin
    waybar
    rofi
    mutt
    kitty
    lolcat
    sl
    cowsay
    tailscale
    i3status
    nerd-fonts.caskaydia-cove
    fira-code
    texliveFull
    nchat
    luarocks
    ollama
    fyi
    bitwarden-menu
    discord-canary
    dict
    fzf
    gccgo
    R
    vim
    webex
    octaveFull
    urlscan
    pup
  ];

  programs.bash = {
    enable = false;
    bashrcExtra = ''
      . ~/.config/bashrc
    '';
    profileExtra = ''
      . ~/.config/bash_profile
    '';
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "mh";
    };
    shellAliases = {
      wcp="wl-copy";
      o="xdg-open";
      v="$EDITOR";
      c="clear";
      st="swaymsg input type:touchpad events toggle";
      bw="gpg -dq ~/.config/master_pwd.gpg | bw";
      t="tmux";
      ta="tmux attach";
      rc-gdrive="sudo rclone mount GDrive-UniPV: ~/GDrive-UniPV   --config /home/oxke/.config/rclone/rclone.conf   --allow-other   --vfs-cache-mode writes   --log-level INFO   --log-file /home/oxke/.config/rclone/gdrive-unipv.log --daemon";
    };
    initContent = ''
      HISTSIZE=10000
      SAVEHIST=10000

      # vim keybindings
      bindkey -v
      set -o vi
      
      # crazy useful utility for showing input and output of line processing commands
      sio() {
          tmp=$(mktemp)

          cat >"$tmp"
          "$@" <"$tmp" | paste -d' ' "$tmp" -
          rm "$tmp"
      }

      nof() {
          local out=$(mktemp)
          local err=$(mktemp)
          { "$@" | tee "$out"; } 2> >(tee "$err" >&2)
          [[ -s $err ]] &&
              fyi -a bash -i error "Execution Failed" "$(cat $err)" ||
              fyi -a bash -i check "Execution Completed" "$(cat $out)"
          rm "$err" "$out"
      }

      get_aoc_input() {
          curl -s https://adventofcode.com/$2/day/$1/input --cookie "session=$AOC_SESSION"
      }

      jn() {
          ssh -L 8888:localhost:8888 -J archoxke,natsrt,dorian,obs seti$1
      }

      curl -s --connect-timeout 0.5 http://archoxke.junco-wall.ts.net:5000 | \
          awk '/<div class="chunk">/,/<\/div>/' | \
          sed 's/<[^>]*>//g' | \
          cowsay -r | \
          fastfetch -l - --logo-color-1 $(grep -q dark ~/.config/theme && echo white || echo black)
    '';
  };
 
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;

    globals.mapleader = ",";
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>m";
        action = "<cmd>w<cr>";
      }
    ];

    colorschemes.oxocarbon.enable = true;
    plugins.lualine.enable = true;
  };

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      vscodevim.vim
      yzhang.markdown-all-in-one

      github.copilot
      github.copilot-chat

      ms-python.python
      ms-python.vscode-pylance
      
      julialang.language-julia

      ms-vscode.cpptools
    ];
  };

  home.stateVersion = "25.05";
}
