{ ... }:

{
    imports = [
        ./boot.nix
        ./filesystem.nix
        ./maintenance.nix
        ./sys_packages.nix
        ./network.nix
        ./locale.nix
        ./users.nix
    ];
}
