{ config, pkgs, ... }:
{
  home.sessionVariables = {
    # -- Desktop --
    XDG_CURRENT_DESKTOP  = "niri";
    XDG_SESSION_TYPE     = "wayland";
    XDG_SESSION_DESKTOP  = "niri";

    # -- Toolkit --
    MOZ_ENABLE_WAYLAND                = "1";
    NIXOS_OZONE_WL                    = "1";
    GTK_THEME                         = "Adwaita-Dark";
    GTK_APPLICATION_PREFER_DARK_THEME = "1";
    QT_QPA_PLATFORMTHEME              = "gtk3";

    # -- Cursor --
    XCURSOR_THEME  = "Bibata-Modern-Classic";
    XCURSOR_SIZE   = "24";
    QT_CURSOR_SIZE = "32";

    # -- Screenshots --
    SCREENSHOT_DIR = "${config.home.homeDirectory}/Pictures/Screenshots";
  };

  home.pointerCursor = {
    name    = "Bibata-Modern-Classic";
    # package = pkgs.bibata-cursors;
    size    = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
