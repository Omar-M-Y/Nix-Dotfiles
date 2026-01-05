import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Item {
  id: root
  width: 30
  height: 30

  MouseArea {
    anchors.fill: parent
    onClicked: {
      if (Pipewire.defaultAudioSink) {
        console.log("Registered Click")
        Pipewire.defaultAudioSink.muted = !Pipewire.defaultAudioSink.muted 
      }
    }
  }

  Text {
    anchors.centerIn: parent
    text: Pipewire.defaultAudioSink && Pipewire.defaultAudioSink.muted
      ? "" 
      : ""
    color: "white"
    // color: "f8f8f2"
    font.pixelSize: 16
  }
}
