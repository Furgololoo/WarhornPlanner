import QtQuick

import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root

    property string baseText: "default"
    property color baseColor: Colors.MainAccent
    property color textColor: Colors.MainBGDarker
    property color hoverColor: Colors.MainAccent
    property real hoverOpacity: 0.7
    property color borderColor: Colors.MainAccent
    property int borderWidth: 0
    property int fontSize: 24
    property int hAlignment: Text.AlignHCenter
    property int vAlignment: Text.AlignVCenter


    signal pressedButton()

    function setBaseColor(selectedColor: color) {
        rect.color = selectedColor
        root.baseColor = selectedColor
        root.hoverColor = selectedColor
    }

    function enableHover() {
        rect.color = root.hoverColor
        rect.opacity = root.hoverOpacity
    }

    function disableHover() {
        rect.color = root.baseColor
        rect.opacity = 1
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        color: root.baseColor
        opacity: 1
        border.width: borderWidth
        border.color: borderColor

        Text {
            id: mainText
            anchors.fill: parent
            anchors.leftMargin: Constants.BigMargin
            text: root.baseText
            font.bold: true
            font.pointSize: fontSize
            color: root.textColor

            horizontalAlignment: hAlignment
            verticalAlignment: vAlignment
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
