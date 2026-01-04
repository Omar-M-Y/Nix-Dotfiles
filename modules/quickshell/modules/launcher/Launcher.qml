import QtQuick
import Quickshell
import Quickshell.Wayland

// We use a Scope to define a new Surface/Window
Scope {
    id: root
    
    // logic to toggle visibility
    property bool active: false

    // Configure the window to float above others (Layer Shell)
    // "Overlay" layer puts it above normal windows
    // "exclusiveZone: -1" means it won't push other windows aside
    anchors.fill: parent
    visible: active

    Panel {
        id: panel
        anchors.centerIn: parent
        width: 500
        height: 300
        
        // Background for the launcher
        color: "#1e1e2e" 
        radius: 12
        border.color: "#89b4fa"
        border.width: 2

        // A simple grid of example apps
        GridView {
            anchors.fill: parent
            anchors.margins: 20
            cellWidth: 100
            cellHeight: 100
            
            model: ListModel {
                ListElement { name: "Terminal"; cmd: "kitty"; icon: "utilities-terminal" }
                ListElement { name: "Firefox"; cmd: "firefox"; icon: "firefox" }
                ListElement { name: "Files"; cmd: "thunar"; icon: "system-file-manager" }
                ListElement { name: "Editor"; cmd: "code"; icon: "text-editor" }
            }

            delegate: Rectangle {
                width: 90
                height: 90
                color: "transparent"
                radius: 8

                // Visual hover effect
                MouseArea {
                    id: ma
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        // Use Quickshell's Process to launch the command
                        // Note: You might need to wrap this in a helper function depending on version
                        Qt.openUrlExternally(model.cmd) 
                        // Or use specific Quickshell execution logic if available
                        root.active = false // Close launcher on click
                    }
                }
                
                // Highlight on hover
                Rectangle {
                    anchors.fill: parent
                    color: "white"
                    opacity: ma.containsMouse ? 0.1 : 0
                    radius: 8
                }

                Column {
                    anchors.centerIn: parent
                    spacing: 5
                    
                    // You can use an Icon component if you have one, or just Text for now
                    Rectangle {
                        width: 48; height: 48
                        color: "#313244"
                        radius: 8
                        // Placeholder for an actual icon image
                        Text { 
                            anchors.centerIn: parent
                            text: model.name.substring(0,1)
                            color: "white"
                        }
                    }
                    
                    Text {
                        text: model.name
                        color: "white"
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }
    }
}
