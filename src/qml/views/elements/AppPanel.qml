import QtQuick
import "../../config/Colors.js" as Colors
import "../../config/Constants.js" as Constants

Item {
    id: root

    signal openUserSettings()

    Connections {
        target: Coffey
        function onUserLogged(userName: string) {
            userText.text = userName
        }
    }

    Rectangle {
        anchors.fill: parent
        color: Colors.MainBG

        // Coffey text
        Text {
            height: parent.height
            width: 100
            anchors.left: parent.left
            anchors.leftMargin: Constants.BigMargin

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: "Coffey"
            font.bold: true
            color: Colors.TextColor
            font.pointSize: 20
        }

        // User info
        Text {
            id: userText
            height: parent.height
            anchors.right: parent.right
            anchors.rightMargin: Constants.BigMargin

            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            text: "NotLogged"
            font.bold: true
            color: Colors.TextColor
            font.pointSize: 20

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    openUserSettings()
                }
            }
        }
    }
}
