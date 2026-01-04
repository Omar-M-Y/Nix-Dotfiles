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
}
