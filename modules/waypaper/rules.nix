{ lib, ... }: {
  wayland.windowManager.hyprland.settings.windowrule = lib.mkAfter [
    # Visuals are now handled by style.css!
    # We only need Geometry rules here:
    "match:class ^(waypaper)$, float on, center on, size 900 700, pin on"
  ];
}
