{ ... }: {
    imports = [
      ./config/environment.nix
      ./config/keybinds.nix
      ./config/input.nix
    ];

    wayland.windowManager.niri = {
        enable = true;

    };
}
