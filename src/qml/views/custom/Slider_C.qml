import QtQuick

import "qrc:/scripts/Colors.js" as Colors
import "qrc:/scripts/Constants.js" as Constants

Item {
    id: root

    property int min: 0
    property int max: 255
    property int defaultValue: 100
    property real ratio: max / (background.width - handler.width)

    onRatioChanged: handler.x = defaultValue / ratio

    Rectangle {
        id: background
        width: parent.width
        height: 6
        radius: 4
        anchors.centerIn: parent
        color: Colors.SubtleAccent

        onWidthChanged: console.log(background.width)

        Rectangle {
            id: selectedArea
            height: 6
            radius: 4
            anchors.left: background.left
            anchors.right: handler.right
            color: Colors.MainAccent
        }

        Rectangle {
            id: handler
            width: root.height * 0.7
            height: root.height * 0.7
            radius: root.height

            anchors.verticalCenter: parent.verticalCenter
            color: Colors.MainAccent

            onXChanged: input.setValue(handler.x * ratio)

            MouseArea {
                anchors.fill: parent

                property real firstPoint: 0

                onPressed: firstPoint = mouseX

                onMouseXChanged: {
                    let xVal =  mouseX - firstPoint

                    if(handler.x + xVal <= 0) {
                        handler.x = 0
                    }
                    else if(handler.x + xVal >= background.width - handler.width) {
                        handler.x = background.width - handler.width
                    }
                    else {
                        handler.x += xVal
                    }
                    console.log("value " + handler.x * ratio)
                }
            }
        }
    }

    IntegerInput_C {
        id: input
        width: 40
        height: 25
        anchors.verticalCenter: background.verticalCenter
        anchors.left: background.right
        anchors.leftMargin: Constants.marginSize()
        onValueChanged: function(value) { handler.x = value/ratio}
    }
}
