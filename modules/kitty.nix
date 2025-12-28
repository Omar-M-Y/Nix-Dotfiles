{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "MesloLGL Nerd Font";
      size = 10;
    };
    settings = {
      window_padding_width = 21.75;
      confirm_os_window_close = 0;
      allow_remote_control = "yes";
      listen_on = "unix:@mykitty";
      cursor_trail = 1;
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
    };
    extraConfig = ''
      include ~/.config/kitty/colors.conf
    '';
  };
}