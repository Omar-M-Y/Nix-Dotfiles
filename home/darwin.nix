# home/darwin.nix
{ pkgs, ... }: {
  imports = [

  ../modules/darwin/default.nix
  ./shared.nix
  ];

  home = {
    username = "yahya";
    homeDirectory = "/Users/yahya/";
    stateVersion = "25.11";

  };

}
