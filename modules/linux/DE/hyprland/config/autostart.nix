{ ... }: {
  imports = [ ./keybinds.nix ];
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # "swww-daemon" # Wallpaper Daemon
      # "matugen &" # Colour
      # "sleep 6 && flatpak run com.discordapp.Discord --start-minimized" # Discord
      "sleep 6 && discord --start-minimized"
      "steam -silent" # steam
      # "waybar"
      "noctalia-shell"
      # "quickshell" # Desktop Shell
      "sleep 6 && easyeffects --gapplication-service" # Audio
      "coolercontrol --minimized"
      # "qs -c noctalia-shell"
      # "$terminal"
      "hyprctl dispatch movecursor 2880 540"
      # "rm -f /tmp/desktop-ready && sleep 2 && touch /tmp/desktop-ready"
    ];
  };
}
