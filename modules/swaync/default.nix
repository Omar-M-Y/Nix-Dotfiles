{ pkgs, config, ... }:

{
  services.swaync = {
    enable = true;
    
    # 1. Config settings (Replaces config.json)
    settings = {
      positionX = "right";
      positionY = "top";
      control-center-width = 500;
      control-center-margin-top = 10;
      control-center-margin-bottom = 10;
      control-center-margin-right = 10;
      control-center-margin-left = 10;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      
      # Fixes the schema error automatically by not including it
    };

    # 2. CSS Style (Replaces style.css)
    # We read your local file so you can keep editing style.css externally if you prefer
    style = builtins.readFile ./style.css;
  };
}
