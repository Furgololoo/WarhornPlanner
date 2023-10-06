import QtQuick

import "qrc:/scripts/Colors.js" as Colors
import "qrc:/scripts/Constants.js" as Constants

Item {
    id: root

    signal pressedButton()

    function enableHover() {
        rect.color = Colors.MainBG
    }

    function disableHover() {
        rect.color = Colors.MainBGDarker
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        color: Colors.MainBGDarker
        border.width: 2
        border.color: Colors.SubtleAccent

        Item {
            id: plus
            height: parent.height
            width: rect.width - mainText.width - mainText.anchors.rightMargin
            anchors.left: parent.left

            Rectangle {
                id: horizontalLine
                color: Colors.MainAccent
                width: parent.width * 0.45
                height: 3
                anchors.centerIn: parent
            }

            Rectangle {
                id: verticalLine
                color: Colors.MainAccent
                height: parent.width * 0.45
                width: 3
                anchors.centerIn: parent
            }
        }

        Text {
            id: mainText
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: Constants.marginSize()
            text: qsTr("   Algorithm")
            font.bold: true
            font.pointSize: root.height / 2
            color: Colors.MainAccent

            width: contentWidth

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled:true
            onContainsMouseChanged: {
                if(containsMouse)
                    enableHover()
                else
                    disableHover()
            }
            onPressed: pressedButton()
        }
    }
}
