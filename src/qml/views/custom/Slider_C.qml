import QtQuick

import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root

    property int min: 0
    property int max: 255
    property int defaultValue: 100
    property real ratio: max / (background.width - handler.width)
    property color baseColor: Colors.MainAccent


    onRatioChanged: handler.x = defaultValue / ratio

    signal valueChanged(value: int)

    Rectangle {
        id: background
        width: parent.width - input.width - Constants.SmallMargin
        height: 6
        radius: 4
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        color: Colors.SubtleAccent

        Rectangle {
            id: selectedArea
            height: 6
            radius: 4
            anchors.left: background.left
            anchors.right: handler.right
            color: baseColor
        }

        Rectangle {
            id: handler
            width: root.height * 0.4
            height: root.height * 0.4
            radius: root.height

            anchors.verticalCenter: parent.verticalCenter
            color: baseColor

            onXChanged: {
                input.setValue(handler.x * ratio)
                valueChanged(handler.x * ratio)
            }

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
        height: parent.height * 0.8
        anchors.verticalCenter: background.verticalCenter
        anchors.left: background.right
        anchors.leftMargin: Constants.SmallMargin
        accentColor: root.baseColor
        onValueChanged: function(value) {
            handler.x = value/ratio
        }
    }
}
