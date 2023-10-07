import QtQuick
import "../../config/Colors.js" as Colors
import "../../config/Constants.js" as Constants
import CustomElements

Item {

    TicketBase {
        id: base
    }

    Rectangle {
        anchors.fill: parent
        color: Colors.SubtleAccent

        Text {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: Constants.SmallMargin
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "Testowy tytul notki, abcdasd, asdasdh, sadkjhsakjdhakjsdhkja"
            color: Colors.TextColor
            font.pointSize: 12
            elide: Text.ElideRight
        }

        Image {
            id: userImg
            source: "qrc:/icons/icons/light/foo.png"
            anchors.right: parent.right
            anchors.rightMargin: Constants.SmallMargin
            anchors.bottomMargin: Constants.SmallMargin
            anchors.bottom: parent.bottom
        }

    }
}
