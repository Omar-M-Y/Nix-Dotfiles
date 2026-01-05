import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray


RowLayout {
  id: root
  spacing: 8

  Repeater {
    model: SystemTray.items

    Image {
      Layout.preferredWidth: 20
      Layout.preferredHeight: 20


      source: modelData.icon
      fillMode: Image.PreserveAspectFit

      MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onClicked: (mouse) => {
          if (mouse.button === Qt.LeftButton) {
            modelData.activate()
          } else if (mouse.button === Qt.RightButton) {
            modelData.menu.open()
          }
        }
      }
    }
  }
}
