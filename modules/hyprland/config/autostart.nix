{ ... }: {
    imports = [ ./keybinds.nix];
  wayland.windowManager.hyprland.settings = {
        exec-once = [
            "swww-daemon" # Wallpaper Daemon
            "discord --start-minimized" # Discord
            "steam -silent" # steam
            "pywal &"
            "pywalfox start &"
            "waybar"
            # "quickshell" # Desktop Shell
            "easyeffects --gapplication-service" # Audio 
            # "$terminal"
        ];
  };
}
