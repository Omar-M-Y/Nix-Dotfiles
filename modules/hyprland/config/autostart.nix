{ ... }: {
    imports = [ ./keybinds.nix];
  wayland.windowManager.hyprland.settings = {
        exec-once = [
            "swww-daemon"
            "discord --start-minimized"
            "steam -silent"
            "matugen"
            "quickshell"
            # "$terminal"
        ];
  };
}
