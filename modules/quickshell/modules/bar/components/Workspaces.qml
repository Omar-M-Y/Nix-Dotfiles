import QtQuick
import Quickshell
import Quickshell.Hyprland
import "../../../" // Import root for Colors

Row {
    id: root
    spacing: 5 // Space between dots

    // Use the native Hyprland workspaces model
    Repeater {
        model: Hyprland.workspaces

        delegate: Rectangle {
            // Access the data for this specific workspace
            // modelData is the workspace object provided by Quickshell
            property var workspace: modelData
            
            height: 20
            
            // Animation logic: Active workspace is wider (30px), others are dots (20px)
            width: workspace.id === Hyprland.focusedWorkspace.id ? 30 : 20
            
            // Smoothly animate the width change
            Behavior on width { NumberAnimation { duration: 200 } }

            radius: height / 2
            
            // Color logic:
            // Active = Primary Color
            // Inactive = Surface/Gray
            color: workspace.id === Hyprland.focusedWorkspace.id 
                   ? Colors.primary 
                   : Colors.surface

            // Click to switch workspace
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // Dispatch the hyprland command to switch
                    Hyprland.dispatch("workspace", workspace.id.toString())
                }
            }
        }
    }
}
