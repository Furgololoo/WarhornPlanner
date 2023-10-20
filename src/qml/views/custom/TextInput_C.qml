import QtQuick
import "qrc:/config/Colors.js" as Colors

Item {
    id: root

    property int fontSize: 12

    function setText(text: string) {
        input.text = text
    }

    function lostFocus() {
        input.focus = false
    }

    signal textChanged(text: string)

    Rectangle {
        id: background
        anchors.fill: parent
        color: Colors.MainBG
        border.width: 1
        border.color: Colors.SubtleAccent

        TextInput {
            id: input
            anchors.fill: parent
            anchors.bottomMargin: 3
            anchors.leftMargin: 8
            color: Colors.TextColor
            verticalAlignment: Text.AlignVCenter

            activeFocusOnPress: true
            selectByMouse: true
            font.pointSize: root.fontSize

            onEditingFinished: input.focus = false

            onFocusChanged: {
                if(focus) {
                    background.border.color = Colors.MainAccent
                }
                else {
                    background.border.color = Colors.SubtleAccent
                    root.textChanged(input.text)
                }
            }
        }
    }
}
