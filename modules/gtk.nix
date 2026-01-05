{ config, pkgs, ... }:

{
  home.file.".config/gtk-3.0/gtk.css".text = ''
    @import url("../../.config/waybar/colors-waybar.css");
    
    menu,
    .menu,
    .context-menu {
      background-color: alpha(@background, 0.5); 
      color: @foreground;
      border-radius: 12px;
      border: 1px solid alpha(@color4, 0.3); 
      padding: 8px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
    }
    
    menuitem {
      background-color: transparent;
      color: @foreground;
      border-radius: 6px;
      padding: 6px 12px;
      margin: 2px;
    }
    
    menuitem:hover {
      background-color: alpha(@color4, 0.3); 
      color: @foreground;
    }
    
    menuitem:active,
    menuitem:selected {
      background-color: @color4; 
      color: @background; 
    }
    
    separator {
      background-color: alpha(@foreground, 0.2);
      min-height: 1px;
      margin: 4px 8px;
    }
  '';

  gtk = {
    enable = true;
    
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    
    gtk4.extraCss = ''
      @import url("../../.config/waybar/colors-waybar.css");
      
      menu,
      .menu,
      .context-menu {
        background-color: alpha(@background, 0.5); 
        color: @foreground;
        border-radius: 12px;
        border: 1px solid alpha(@color4, 0.3); 
        padding: 8px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
      }
      
      menuitem {
        background-color: transparent;
        color: @foreground;
        border-radius: 6px;
        padding: 6px 12px;
        margin: 2px;
      }
      
      menuitem:hover {
        background-color: alpha(@color4, 0.3); 
        color: @foreground;
      }
      
      menuitem:active,
      menuitem:selected {
        background-color: @color4; 
        color: @background; 
      }
      
      separator {
        background-color: alpha(@foreground, 0.2);
        min-height: 1px;
        margin: 4px 8px;
      }
    '';
    
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
