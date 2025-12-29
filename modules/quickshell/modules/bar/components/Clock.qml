import QtQuick
// We need to import the root to access colors, since this is a new file
import "../../../" 

Text {
    id: root
    
    // Default styling (can be overridden when you use the component)
    color: Colors.onBackgroundColor
    // anchors.centerIn: parent
    //
    //
    //
    //
    anchors.right: parent.right

    anchors.verticalCenter: parent.verticalCenter

    anchors.rightMargin: 15
      
    function updateTime() {
        text = Qt.formatDateTime(new Date(), "ddd MMM d hh:mm")
    }

    Component.onCompleted: updateTime()

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.updateTime()
    }
}
