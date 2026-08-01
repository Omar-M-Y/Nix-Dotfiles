{ inputs, ... }:
{ system, isDarwin, homeFile, user ? "yahya" }:


inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {
        inherit system; 
        config.allowUnfree = true;
    };
    extraSpecialArgs = { inherit inputs isDarwin; };
    modules = [ homeFile ];
}

