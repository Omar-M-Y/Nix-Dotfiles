{ ... }: {
    imports = [ ./keybinds.nix];
  wayland.windowManager.hyprland.settings = {
        exec-once = [
            "swww-daemon"
            "matugen"
            "$terminal"
        ];
  };
}