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

    Rectangle {
        anchors.fill: parent
        color: Colors.MainBGDarker

        AppPanel {
            id: appPanel
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: 40
        }

        MenuPanel {
            id: menuPanel
            anchors.top: appPanel.bottom
            anchors.topMargin: Constants.BigMargin
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Constants.BigMargin
            anchors.left: parent.left
        }

        Board {
            id: board
            anchors.top: appPanel.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Constants.BigMargin
            anchors.left: menuPanel.right
            anchors.leftMargin: Constants.BigMargin
            anchors.right: parent.right
        }
    }
}
