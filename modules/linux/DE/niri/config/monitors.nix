{ ... }:
{
  programs.niri.settings.outputs = {

    "HDMI-A-1" = {
      mode = {
        width   = 1920;
        height  = 1080;
        refresh = 75.0;
      };
      position = { x = 0; y = 0; };
    };

    "DP-1" = {
      mode = {
        width   = 1920;
        height  = 1080;
        refresh = 240.0;
      };
      position             = { x = 1920; y = 0; };
      variable-refresh-rate = "on-demand";
      focus-at-startup     = true;
    };

  };
}
