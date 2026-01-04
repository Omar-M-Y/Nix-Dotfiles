import QtQuick
import Quickshell

// Import the directory where Bar.qml lives
import "./modules/bar"
import "./modules/launcher"
// import modules.bar
ShellRoot {
    // Instantiate the Bar component
    Bar {}

    Launcher {
        id: appLauncher
        active: false // Start hidden
      }

    // (You likely already have a Bar, put this Button logic inside there)
    Scope {
        anchors {
            bottom: parent.bottom
            left: parent.left
            margins: 20
        }
        width: 50; height: 50

        Panel {
            anchors.fill: parent
            color: "#89b4fa"
            radius: 25

            Text {
                anchors.centerIn: parent
                text: "🚀"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // 3. Toggle the launcher state
                    appLauncher.active = !appLauncher.active
                }
              }
            }
          }
}
