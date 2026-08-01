{ inputs, ... }:
{ hostname, system ? "x86_64-linux", user ? "yahya" }:

inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
        ../hosts/${hostname}/default.nix
        inputs.home-manager.nixosModules.home-manager
        #inputs.noctalia.nixosModules.default 
        {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [
                inputs.nix-cachyos-kernel.overlays.pinned
            ];
        }
        {
            home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = { inherit inputs; isDarwin = false; };
                users.${user} = {
                    imports = [
                        ../home/nixos.nix
                        #inputs.noctalia.homeModules.default
                    ];
                };
            };
        }
    ];
}
