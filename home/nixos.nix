{ pkgs, inputs, lib, ... }: {
    imports = [
        ../modules/linux/default.nix
        ./shared.nix
    ];
    
    fonts.fontconfig.enable = true;
    
    home = {
        username      = "yahya";
        homeDirectory = "/home/yahya";
        stateVersion  = "26.05";
        sessionVariables = {
            XDG_SESSION_TYPE = "wayland";
        };
        pointerCursor = {
            gtk.enable = true;
            x11.enable = true;
            package    = pkgs.bibata-cursors;
            name       = "Bibata-Modern-Classic";
            size       = 24;
        };
    };
}
