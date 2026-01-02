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

      implicitHeight: 36
      // color: Colors.background
      color: "transparent"



      Workspaces {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 15
      }

      ActiveWindow {
        anchors.centerIn: parent
      }
      // Now we just use the custom component
      Clock {}



    }
  }
}
