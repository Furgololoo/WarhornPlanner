import QtQuick

import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root

    property string baseText: "default"

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
        border.width: 1
        border.color: Colors.SubtleAccent

        Text {
            id: mainText
            anchors.fill: parent
            anchors.leftMargin: Constants.BigMargin * 2
            text: baseText
            font.bold: true
            font.pointSize: 20
            color: Colors.MainAccent

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
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
