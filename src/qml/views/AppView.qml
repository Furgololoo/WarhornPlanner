import QtQuick
import "elements/"
import "elements/popup"
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {

    Connections {
        target: PopupManager
        function onRaiseError(text) {}
    }
    Connections {
        target: appPanel
        function onOpenUserSettings() {
            loader.setSource("qrc:/views/Account.qml")
        }
    }

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
            onChangeWindow: function (windowUrl) { loader.setSource(windowUrl) }
            z: 2
        }

        Loader {
            id: loader
            anchors.top: appPanel.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Constants.BigMargin
            anchors.left: parent.left
            anchors.leftMargin: Constants.BigMargin + 40
            anchors.right: parent.right
            source: "qrc:/views/Account.qml"
            z: 1

            ErrorStack {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.8
                z: 3
            }

            NotifyStack {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: Constants.SmallMargin
                anchors.right: parent.right
                anchors.rightMargin: Constants.SmallMargin
                width: parent.width * 0.2
                z: 3
            }
        }
    }
}
