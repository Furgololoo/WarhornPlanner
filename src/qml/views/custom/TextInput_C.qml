import QtQuick

import "qrc:/scripts/Colors.js" as Colors

Item {

    function setText(text: string) {
        input.text = text
    }

    signal textChanged(text: string)

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
            anchors.leftMargin: 8
            color: Colors.TextColor
            verticalAlignment: Text.AlignVCenter

            activeFocusOnPress: true
            selectByMouse: true
            font.pointSize: 12

            onEditingFinished: input.focus = false

            onFocusChanged: {
                if(focus) {
                    background.border.color = Colors.MainAccent
                }
                else {
                    background.border.color = Colors.MainBGDarker
                    textChanged(input.text)
                }
            }
        }
    }
}
