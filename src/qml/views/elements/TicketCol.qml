import QtQuick
import "../../config/Colors.js" as Colors
import "../../config/Constants.js" as Constants

Item {
    id: root

    property string title: "undefined"

    Rectangle {
        id: header
        width: parent.width
        height: 45
        anchors.top: parent.top
        color: Colors.MainBGDarker

        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: title
            color: Colors.PlaceholderTextColor
            font.pointSize: 15
        }
    }

    Rectangle {
        id: mainRect
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        color: Colors.MainBG

        Column {
            id: column
            anchors.fill: parent
            anchors.margins: {
                Constants.SmallMargin
                Constants.SmallMargin
                Constants.SmallMargin
                Constants.SmallMargin
            }

            Ticket {
                width: column.width
                height: column.width * 0.8
            }
        }
    }
}

