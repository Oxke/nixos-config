{ config, pkgs, ... }:
{
  programs.htop = {
    enable = true;
    package = pkgs.htop-vim;
  };

  environment.variables = {
    PS1 = ''[\u@\h \W]\$'';
    TERM = "kitty";
    TERMINAL = "kitty";
    BROWSER = "floorp";
    LESS = ''-i -j10 -Pm?f%f.?L?f - .?e%L/%L:?lj%lj/%L:\?/%L...?pj?f (:?L (..%pj\%?f):?L)...?m?f - :?L - :?pj - ...%i/%m. -m'';
    APPUNTI = "$HOME/Documents/Appunti";
    AOC_SESSION = ""; # ADD IT NEXT WINTER
  };

  programs.foot.enable = false;
}
