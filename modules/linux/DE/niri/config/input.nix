{ ... }:
{
  programs.niri.settings.input = {

    keyboard = {
      xkb = {
        layout  = "us,gb";
        options = "grp:alt_space_toggle";
      };
      numlock = true;
    };

    mouse = {
      accel-profile = "flat";
      accel-speed   = 0.0;
    };

    focus-follows-mouse = {
      enable = true;
    };

    warp-mouse-to-focus.enable = false;

  };
}
