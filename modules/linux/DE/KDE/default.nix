{ pkgs, ... }: {
    imports = [
      ./config/panels.nix
      ./config/autostart.nix
      ./config/default_apps.nix
      ./config/windows.nix
    ];

    home.packages = [
      pkgs.plasma-panel-colorizer
    ];
    programs.plasma = {
        enable = true;
        overrideConfig = true;

        workspace = {
          clickItemTo = "select";
          lookAndFeel = "org.kde.breezedark.desktop";
          cursor.theme = "Bibata-Modern-Classic";
          # iconTheme = "Papirus-Dark";
          wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920.png";
        };
      };
  }
