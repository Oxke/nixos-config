{
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
}
