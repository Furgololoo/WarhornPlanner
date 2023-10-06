import QtQuick
import "views/"
import "views/elements/"
import "config/Colors.js" as Colors
import "config/Constants.js" as Constants

Window {
    id: window
    title: qsTr("Coffey")
    visibility: Qt.WindowFullScreen
    visible: true
    width: 1400
    height: 800


    AppPanel {
        id: appPanel
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 40
    }

    Board {
        id: board
        anchors.top: appPanel.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }
}
