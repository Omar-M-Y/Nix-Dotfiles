{ pkgs, config, lib, ... }: # <--- 1. Add 'lib' here if missing

let
  colorsPath = "${config.home.homeDirectory}/.config/rofi/colors.rasi";
in
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "style-1"; 
    font = "JetBrainsMono Nerd Font 10";
    extraConfig = {
      modi = "drun";
      show-icons = true;
      display-drun = "Apps:";
      dpi = 0;
    };
  };

  # Generate the style file
  xdg.configFile."rofi/style-1.rasi".text = import ./style-1.nix {
    inherit colorsPath; 
  };

  # --- THE FIX: Activation Script ---
  # This runs every time you rebuild home-manager.
  # It checks if colors.rasi exists. If not, it creates a dummy file 
  # so Rofi doesn't crash on the first run.
  home.activation.ensureRofiColors = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ ! -f "${colorsPath}" ]; then
      echo "No Rofi colors found. Creating default placeholder at ${colorsPath}..."
      cat > "${colorsPath}" <<EOF
/* Default placeholder colors until Matugen runs */
* {
    background: #1e1e2e;
    foreground: #cdd6f4;
    border-color: #89b4fa;
    normal-background: transparent;
    normal-foreground: #cdd6f4;
    selected-normal-background: #89b4fa;
    selected-normal-foreground: #1e1e2e;
    alternate-normal-background: transparent;
    alternate-normal-foreground: #cdd6f4;
}
EOF
    fi
  '';
}
