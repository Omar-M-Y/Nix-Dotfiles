# rofi/default.nix
{ pkgs, config, ... }:

let
  # Extract mkLiteral from the Home Manager library
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    # package = pkgs.rofi-wayland;

    # Basic Configuration
    font = "JetBrainsMono Nerd Font 10";
    extraConfig = {
      modi = "drun";
      show-icons = true;
      display-drun = "Apps:";
      dpi = 0;
    };

    # Import the theme from the separate file, passing mkLiteral to it
    theme = import ./style-1.nix { inherit mkLiteral; };
  };
}
