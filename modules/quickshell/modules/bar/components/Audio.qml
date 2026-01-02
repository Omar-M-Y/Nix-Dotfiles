import Quickshell
import QtQuick
import Quickshell.Services.Pipewire

Item {

  property var sink: Pipewire.defaulAudioSink

  width: 100
  height: 30


  Rectangle {
    anchors.fill: parent
    color: sink && sink.audio.muted ? "#ff5555" : "#333333"
    radius: 5 

    Text {
      anchors.centerIn: parent
      color: "white"
      text: sink ? Math.round(sink.audio.volume * 100) + "%" : "--"
    }
  }

  MouseArea {
    anchors.fill: parent

    onClicked: {
      if (sink) sink.audio.muted = !sink.audio.muted
    }

    onWheel: (wheel) => {
      if (!sink) return

      const change = wheel.angleDelta.y > 0 ? 0.05 : -0.05
      sink.audio.volume = Math.max(0, Math.min(1, sink.audio.volume + change))
    }
  }
}

