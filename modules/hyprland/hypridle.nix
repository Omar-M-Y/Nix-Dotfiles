{ pkgs, ... }: {

  services.hypridle = {
    enable = true;

    settings = {
      general = {
        # Added playerctl pause and fixed typo (pidoff -> pidof)
        # Using pkgs.procps for 'pidof' and pkgs.playerctl for 'playerctl'
        lock_cmd = "${pkgs.playerctl}/bin/playerctl --all-players pause; ${pkgs.procps}/bin/pidof hyprlock || hyprlock";
        
        before_sleep_cmd = "loginctl lock-session";
        
        # THE FIX: This 1s delay gives the GPU time to wake up before turning the screen on
        after_sleep_cmd = "sleep 1 && hyprctl dispatch dpms on";
      };

      listener = [
        # 1. Dim Monitor Backlight (2.5min)
        {
          timeout = 150;
          on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10";
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -r";
        }

        # 2. Turn Off Keyboard Backlight (2.5min)
        {
          timeout = 150;
          on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -sd rgb:kbd_backlight set 0";
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -rd rgb:kbd_backlight";
        }

        # 3. Lock Screen (10min)
        {
          timeout = 600;
          on-timeout = "loginctl lock-session";
        }

        # 4. Screen Off (11min)
        {
          timeout = 660;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
