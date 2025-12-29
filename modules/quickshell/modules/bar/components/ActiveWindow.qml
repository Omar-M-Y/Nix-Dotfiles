import QtQuick
import Quickshell
import Quickshell.Io
import "../../../" 

Text {
    id: root

    // Store the title here
    property string windowTitle: ""

    text: windowTitle !== "" ? windowTitle : ""
    color: Colors.onBackgroundColor
    font.bold: true
    elide: Text.ElideRight
    width: Math.min(implicitWidth, 600)

    // --- THE FIX: MANUAL PROCESS ---
    Process {
        id: proc
        // Ask Hyprland for the active window in JSON format
        command: ["hyprctl", "activewindow", "-j"]
        
        stdout: StdioCollector {
            onStreamFinished: {
                try {
                    var data = JSON.parse(this.text)
                    // If the title exists, update our property
                    if (data && data.title) {
                        root.windowTitle = data.title
                    } else {
                        root.windowTitle = ""
                    }
                } catch(e) {
                    // Ignore JSON parse errors (happens if output is empty)
                    root.windowTitle = ""
                }
            }
        }
    }

    // Run this check every 200ms (5 times a second)
    // This is very lightweight for the system.
    Timer {
        interval: 200
        running: true
        repeat: true
        onTriggered: proc.running = true
    }
}
