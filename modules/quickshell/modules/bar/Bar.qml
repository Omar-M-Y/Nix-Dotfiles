import QtQuick
import Quickshell
import Quickshell.Io

// Import the root for Colors
import "../../"

// Import your new components folder
import "components"

Variants {
  model: Quickshell.screens

  delegate: Component {
    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30
      color: Colors.background

      // Now we just use the custom component
      Clock {
          anchors.centerIn: parent
      }
    }
  }
}