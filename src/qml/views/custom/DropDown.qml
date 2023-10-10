import QtQuick
import "../../config/Colors.js" as Colors
import "../../config/Constants.js" as Constants

Item {
    id: root
    height: 40

    Rectangle {
        id: topRect
        width: parent.width
        height: 40
        color: Colors.SubtleAccent

        Image {
            id: icon
            anchors.left: parent.left
            anchors.leftMargin: Constants.BigMargin
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/icons/light/more.png"
        }

        Text {
            id: sprintName
            anchors.left: icon.right
            anchors.leftMargin: Constants.BigMargin * 3
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: "Sprint 14 | Adding mechanics"
            color: Colors.TextColor
            font.pointSize: 14
            elide: Text.ElideRight
        }

        Text {
            id: sprintData
            anchors.right: parent.right
            anchors.rightMargin: Constants.BigMargin * 4
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: "03.10.2023 - 24.10.2023"
            color: Colors.TextColor
            font.pointSize: 14
            elide: Text.ElideRight
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            property bool state: false

            onClicked: {
                if(!state) {
                    repeater.model = 6//Math.floor(Math.random() * 7)
                    icon.source = "qrc:/icons/icons/light/less.png"
                }
                else {
                    repeater.model = 0
                    icon.source = "qrc:/icons/icons/light/more.png"
                }
                mouseArea.state = !mouseArea.state
            }
        }
    }

    Column {
        id: column
        anchors.top: topRect.bottom
        anchors.topMargin: Constants.SmallMargin
        width: parent.width
        spacing: Constants.SmallMargin

        onHeightChanged: root.height = 40 + column.height + ((column.height === 0) ? 0 : Constants.BigMargin)

        Repeater {
            id: repeater
            anchors.fill: parent

            Rectangle {
                width: parent.width
                height: 35
                color: Colors.Green
            }
        }
    }
}
