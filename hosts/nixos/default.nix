{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        # ./desktop/default.nix
        ../../desktops/default.nix
        ./system/default.nix
        ./hardware/default.nix
        ../../services/default.nix
    ];
    
    system.stateVersion = "25.11";
}
