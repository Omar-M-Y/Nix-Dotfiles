# modules/linux/programs.nix
{ pkgs, ... }: {
  programs = {
    fish = {
      enable = true;
      useBabelfish = true;
    };
    coolercontrol = {
       enable = true;
      };
    gamemode.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
    };
    virt-manager.enable = true;
  };

  virtualisation.libvirtd.enable = true;
}
