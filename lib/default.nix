{ inputs, ... }:

{
    mkHost = import ./mkHost.nix   { inherit inputs; };
    mkDarwin = import ./mkDarwin.nix { inherit inputs; };
    mkHome   = import ./mkHome.nix   { inherit inputs; };
}
