import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Item {
  id: root
  width: 30
  height: 30

  MouseArea {
    anchors.fill: parent
    onClicked: console.log("Registered Click")
  }

  Text {
    anchors.centerIn: parent
    text: Pipewire.defaultAudioSink.muted ? "" : ""
    color: "f8f8f2"
    font.pixelSize: 16
  }
}
