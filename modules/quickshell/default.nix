{ config, pkgs, ... }:

{
  # 1. Link the shell.qml file
  xdg.configFile."quickshell/shell.qml".source = ./shell.qml;

  # 2. Link the ENTIRE modules directory
  # This ensures modules/bar/Bar.qml and modules/bar/qmldir exist
  xdg.configFile."quickshell/modules".source = ./modules;

  # Define the root qmldir so Colors can be imported as a Singleton
  xdg.configFile."quickshell/qmldir".text = ''
    singleton Colors 1.0 Colors.qml
  '';
  # 3. Colors.qml placeholder
  #xdg.configFile."quickshell/Colors.qml".text = ''
  #  pragma Singleton
  #  import QtQuick
  #  QtObject {
  #      property color background: "#1e1e2e"
   #     property color primary:    "#89b4fa"
  #  }
  #'';
}