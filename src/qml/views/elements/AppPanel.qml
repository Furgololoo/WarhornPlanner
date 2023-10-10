import QtQuick
import "../../config/Colors.js" as Colors
import "../../config/Constants.js" as Constants

Item {
    id: root

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
            id: text1
            height: parent.height
            anchors.right: parent.right
            anchors.rightMargin: Constants.BigMargin

            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            text: "Szkuti"
            font.bold: true
            color: Colors.TextColor
            font.pointSize: 20

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    // open user panel
                    BoardManager.showTickets()
                }
            }
        }
    }
}
