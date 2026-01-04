{ ... }: {
    imports = [ ./keybinds.nix];
  wayland.windowManager.hyprland.settings = {
        exec-once = [
            # "swww-daemon"
            "discord --start-minimized"
            "steam -silent"
            # "matugen"
            # "ambxst"
            # "quickshell"
            # "$terminal"
        ];
  };
}
