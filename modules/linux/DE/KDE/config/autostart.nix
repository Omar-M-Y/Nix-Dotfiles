{ pkgs, ... }: {

  xdg.configFile."autostart/discord.desktop".source = 
    "${pkgs.discord}/share/applications/discord.desktop";
  # xdg.configFile."autostart/steam.desktop".text = ''
  #     [Desktop Entry]
  #     Name=Steam
  #     Exec=steam -silent %U
  #     Icon=steam
  #     Terminal=false
  #     Type=Application
  #     Categories=Network;FileTransfer;Game;
  #   '';
}
