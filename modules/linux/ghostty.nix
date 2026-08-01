{ pkgs, ... }: {
  home.packages = [ pkgs.ghostty ];
  xdg.configFile."ghostty/config".text = ''
    font-family = MesloLGL Nerd Font
    font-size = 10
    window-padding-x = 16
    window-padding-y = 16
    window-padding-balance = true
    background = #000000
    foreground = #cdd6f4
    shell-integration = fish
    command = ${pkgs.fish}/bin/fish
  '';
}
