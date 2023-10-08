import QtQuick
import "../../config/Colors.js" as Colors
import "../../config/Constants.js" as Constants
import CustomElements

Item {

    property var data_json: []

    TicketBase {
        id: base
        onTicketReadyToDisplay: {
            titleText.text = base.getTitle()
        }
    }

    onData_jsonChanged: base.setData(data_json)

    Rectangle {
        anchors.fill: parent
        color: Colors.SubtleAccent

        Text {
            id: titleText
            anchors.top: parent.top
            anchors.topMargin: Constants.SmallMargin
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: Constants.SmallMargin
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: "undefined"
            color: Colors.TextColor
            font.pointSize: 13
            elide: Text.ElideRight
        }

        UserImage {
            anchors.right: parent.right
            anchors.rightMargin: Constants.SmallMargin
            anchors.bottomMargin: Constants.SmallMargin
            anchors.bottom: parent.bottom
        }
    }
}
