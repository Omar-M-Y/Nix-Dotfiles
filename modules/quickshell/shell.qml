import QtQuick
import Quickshell
import Quickshell.Wayland  // <--- ADD THIS LINE!
import "."

Window {
    anchors {
        top: true
        left: true
        right: true
    }
    height: 40
    color: "transparent"
    
    // This requires Quickshell.Wayland
    exclusionMode: ExclusionMode.Normal

    Rectangle {
        anchors.fill: parent
        color: Colors.background || "#1e1e2e"
        opacity: 0.95

        Text {
            anchors.centerIn: parent
            text: "Quickshell Active"
            color: Colors.primary || "#ffffff"
        }
    }
}
