{ ... }: {
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = "yes";

      # --- Bezier Curves ---
      bezier = [
        "sequoia, 0.05, 0.9, 0.1, 1.05"
        "linear, 0, 0, 1, 1"
        "smoothEase, 0.25, 0.1, 0.25, 1"
      ];

      # --- Window Animations ---
      # Pop in from 80% size (mimics the "zoom from dock" feel)
      animation = [
        "windowsIn, 1, 2, sequoia, popin 80%"
        "windowsOut, 1, 2, sequoia, popin 80%"
        "windowsMove, 1, 2, sequoia"

        # --- Fade Animations ---
        "fade, 1, 2, linear"
        "fadeIn, 1, 2, linear"
        "fadeOut, 1, 2, linear"
        "fadeSwitch, 1, 3, linear"
        "fadeShadow, 1, 3, linear"
        "fadeDim, 1, 3, linear"

        # --- Workspace Animations ---
        "workspaces, 1, 2, smoothEase, slide"

        # --- Border ---
        "border, 1, 10, default"
        "borderangle, 0"
      ];
    };

    render = {
      # 0 disables the color transition animation, which fixes the lag
      ctm_animation = 0;
    };
  };
}