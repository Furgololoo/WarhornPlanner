import QtQuick

import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    property int min: 0
    property int max: 255
    property color accentColor: Colors.MainAccent

    function inputValidator(value: int) {
        if(value > max)
            input.text = max
        else if(value < min)
            input.text = min
        else {
            let validNumber = parseFloat(value.replace(',', '.').replace(' ', ''))
            let roundedValue = Math.round(validNumber)
            if(!isNaN(roundedValue))
                input.text = roundedValue
            else
                input.text = min
        }
        valueChanged(input.text)
    }

    function setValue(value: int) {
        input.text = value
        inputValidator(input.text)
    }

    signal valueChanged(value: int)

    Rectangle {
        id: background
        anchors.fill: parent
        color: Colors.SubtleAccent
        border.width: 1
        border.color: Colors.MainBGDarker

        TextInput {
            id: input
            anchors.fill: parent
            anchors.bottomMargin: 3
            color: Colors.TextColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            activeFocusOnPress: true
            selectByMouse: true
            font.pointSize: 12

            onEditingFinished: input.focus = false

            onFocusChanged: {
                if(focus) {
                    background.border.color = root.accentColor
                }
                else {
                    background.border.color = Colors.MainBGDarker
                    inputValidator(input.text)
                }
            }
        }
    }
}
