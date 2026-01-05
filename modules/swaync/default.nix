{ pkgs, lib, config, ... }:

let
  # Import the configuration set from config.nix
  swayncConfig = import ./config.nix;
in
{
  config = {
    programs.swaync = {
      enable = true;
      settings = swayncConfig;
      style = ./style.css;
    };
  };
}
