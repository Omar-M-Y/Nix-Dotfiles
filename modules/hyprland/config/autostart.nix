{ ... }: {
    imports = [ ./keybinds.nix];
  wayland.windowManager.hyprland.settings = {
        exec-once = [
            "swww-daemon" # Wallpaper Daemon
            "discord --start-minimized" # Discord
            "steam -silent" # Steam
            "matugen" # Colour Daemon
            "quickshell" # Desktop Shell
            "easyeffects" # Audio 
            # "$terminal"
        ];
  };
}
