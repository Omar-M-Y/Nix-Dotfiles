{ pkgs, ... }: {
  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      tty_mode = true;
      color_theme = "TTY";
    };
  };
}
