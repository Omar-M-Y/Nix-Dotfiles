{ ... }:
{
  programs.niri.settings = {

    xwayland-satellite.enable = true;

    spawn-at-startup = [
      { command = [ "noctalia" ]; }
      { command = [ "easyeffects" "--gapplication-service" ]; }
      { command = [ "discord" "--start-minimized" ]; }
      { command = [ "steam" "-silent" ]; }
      { command = [ "coolercontrol" "--minimized" ]; }
    ];

  };
}
