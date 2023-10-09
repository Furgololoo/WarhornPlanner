import QtQuick
import QtQuick.Effects
import "../../config/Colors.js" as Colors
import "../../config/Constants.js" as Constants
import CustomElements

Item {
    id: root
    property var data_json: []

    signal hoverBegin()
    signal hoverEnd()

    function getPriorityColor() {
        return priorityImage.getColor()
    }

    TicketBase {
        id: base
        onTicketReadyToDisplay: {
            titleText.text = base.getTitle()
            priorityText.text = base.getPriority()
            componentText.text = base.getComponent()
            timeText.text = base.getUpdateDate()
            assigneeText.text = base.getAssigneeName()
            priorityImage.setDotsCount(base.getPriorityInt())
        }
    }

    onData_jsonChanged: base.setData(data_json)

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: Colors.SubtleAccent
        z: 3

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
            font.pointSize: 14
            elide: Text.ElideRight
        }

        Text {
            id: priorityText
            anchors.top: titleText.bottom
            //            anchors.verticalCenter: parent.verticalCenter
            anchors.topMargin: Constants.SmallMargin
            anchors.left: parent.left
            anchors.leftMargin: Constants.SmallMargin
            width: 25
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: "undefined"
            color: Colors.TextColor
            font.pointSize: 14
        }

        PriorityImage {
            id: priorityImage
            anchors.top: priorityText.top
            anchors.bottom: priorityText.bottom
            anchors.left: priorityText.right
            anchors.right: parent.right
            anchors.leftMargin: Constants.SmallMargin
        }

        Text {
            id: timeText
            anchors.top: priorityText.bottom
            anchors.topMargin: Constants.SmallMargin
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: Constants.SmallMargin
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: "undefined"
            color: Colors.TextColor
            font.pointSize: 12
            elide: Text.ElideRight
        }

        Text {
            id: componentText
            anchors.top: timeText.bottom
            anchors.topMargin: Constants.SmallMargin
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: Constants.SmallMargin
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: "undefined"
            color: Colors.TextColor
            font.pointSize: 12
            elide: Text.ElideRight
        }

        Text {
            id: assigneeText
            anchors.top: componentText.bottom
            anchors.topMargin: Constants.SmallMargin
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: Constants.SmallMargin
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: "undefined"
            color: Colors.TextColor
            font.pointSize: 12
            elide: Text.ElideRight
        }

        UserImage {
            anchors.right: parent.right
            anchors.rightMargin: Constants.SmallMargin
            anchors.bottomMargin: Constants.SmallMargin
            anchors.bottom: parent.bottom
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onHoveredChanged: {
                if(containsMouse)
                    root.hoverBegin()
                else
                    root.hoverEnd()
            }
        }
    }
}

