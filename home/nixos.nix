{ pkgs, inputs, lib, ... }: {
    imports = [
        ../modules/linux/default.nix
        ./shared.nix
    ];

    fonts.fontconfig.enable = true;

    home = {
        username = "yahya";
        homeDirectory = "/home/yahya";
        stateVersion = "25.11";
        sessionVariables = {
            XDG_SESSION_TYPE = "wayland";
        };
    };

    nixpkgs.config.allowUnfree = true;
    }
