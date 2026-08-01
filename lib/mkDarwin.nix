{ inputs, ... }:
{ hostname, system ? "aarch64-darwin", user ? "yahya" }:

inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
        ../hosts/${hostname}/default.nix
        inputs.home-manager.darwinModules.home-manager
        {
            nixpkgs.config.allowUnfree = true;
            home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = { inherit inputs; isDarwin = true; };
                users.${user}.imports = [ ../home/darwin.nix ];
            };
        }
    ];
}
