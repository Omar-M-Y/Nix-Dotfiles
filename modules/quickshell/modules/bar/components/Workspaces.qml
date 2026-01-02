import QtQuick
import Quickshell
import Quickshell.Hyprland
import "../../../" // Import root for Colors

Row {
    id: root
    spacing: 5 // Space between dots
    Rectangle {
        id: wtray
        color: Colors.background
        

        width: layout.width + (padding * 2)
        height: layout.height + (padding * 2)
        radius: height / 2.5 

        border.color: "transparent"
        border.width: 1

        property int padding: 5 

        Row { 
          id: layout
          anchors.centerIn: parent 
          spacing: 5
        // Use the native Hyprland workspaces model
        Repeater {
            model: Hyprland.workspaces

            delegate: Rectangle {
                // Access the data for this specific workspace
                // modelData is the workspace object provided by Quickshell
                property var workspace: modelData
            
                height: 20

                Text {
                  anchors.centerIn: parent
                  // text: workspace.id.toLocaleString(Qt.locale("ar-EG"))

                  text: workspace.id
                  color: Colors.onBackgroundColor

                  font.family: "MesloLGL Nerd Font" 
                  font.pixelSize: 10 
                  font.bold: true
                }  
            
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
                      : (mouseArea.containsMouse
                            ? Colors.outline
                            : Colors.surface)



                // Click to switch workspace
                MouseArea {
                    id:mouseArea
                    hoverEnabled: true


                    anchors.fill: parent
                    onClicked: {
                      // Dispatch the hyprland command to switch
                        const command = "workspace " + workspace.id
                        console.log("Sending command:", command)
                        Hyprland.dispatch(command)
                      }
                }
            } 
         }
      }
    }
}
