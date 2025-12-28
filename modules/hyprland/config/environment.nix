{ config, pkgs, ... }:

{
  # 1. Set Session Variables (Replaces 'env = ...')
  home.sessionVariables = {
    # -- Desktop Specs --
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";

    # -- Toolkit Backends --
    MOZ_ENABLE_WAYLAND = "1"; # Firefox on Wayland

    # -- Theming Variables --
    GTK_THEME = "Adwaita-Dark";
    GTK_APPLICATION_PREFER_DARK_THEME = "1";
    
    # Tell Qt apps to use the GTK theme so they look consistent
    QT_QPA_PLATFORMTHEME = "gtk3"; 

    # -- Cursor Variables --
    # (Note: The 'home.pointerCursor' block below handles the actual package install)
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_SIZE = "24";
    QT_CURSOR_SIZE = "32"; # You had 32 in your config, keeping it consistent

    # -- Screenshots --
    # Use config.home.homeDirectory to safely get the user's home path
    HYPRSHOT_DIR = "${config.home.homeDirectory}/Pictures/Screenshots";
  };

  # 2. The "Nix Way" to handle Cursors
  # This automatically downloads the package and sets up the GTK/X11 links
  # so you don't get a missing cursor in some apps.
  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
