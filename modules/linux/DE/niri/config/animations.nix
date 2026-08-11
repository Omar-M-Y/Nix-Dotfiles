{ ... }: {
  programs.niri.settings.animations = {
    slowdown = 0.5;

    window-open.kind      = { easing = { duration-ms = 200; curve = "ease-out-expo"; }; };
    window-close.kind     = { easing = { duration-ms = 200; curve = "ease-out-expo"; }; };
    window-movement.kind  = { easing = { duration-ms = 200; curve = "ease-out-expo"; }; };
    window-resize.kind    = { easing = { duration-ms = 200; curve = "ease-out-expo"; }; };
    workspace-switch.kind           = { easing = { duration-ms = 200; curve = "ease-out-expo"; }; };
    horizontal-view-movement.kind   = { easing = { duration-ms = 200; curve = "ease-out-expo"; }; };
  };
}
