# home/darwin.nix
{ pkgs, ... }: {
  imports = [
  ../modules/darwin/default.nix
  ];

home = {
  username = "yahya";
  homeDirectory = "/Users/yahya/";
  stateVersion = "25.11";

  };

}
