{ ... }: {
  imports = [
    ./packages.nix
    ./kitty.nix
    # ./ghostty.nix
    # ./viu.nix
    ./DE/noctalia.nix
    ./DE/hyprland/default.nix
    ./matugen.nix
  ];
}
