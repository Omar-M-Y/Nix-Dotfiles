{ config, pkgs, ... }:

{
  # 1. Link the shell.qml file directly
  # This copies your local file to ~/.config/quickshell/shell.qml
  xdg.configFile."quickshell/shell.qml".source = ./shell.qml;

  # 2. Link the qmldir
  xdg.configFile."quickshell/qmldir".source = ./qmldir;

  # 3. Create the Colors.qml placeholder (Matugen will overwrite this)
  xdg.configFile."quickshell/Colors.qml".text = ''
    pragma Singleton
    import QtQuick
    QtObject {
        property color background: "#1e1e2e"
        property color primary:    "#89b4fa"
    }
  '';
}
