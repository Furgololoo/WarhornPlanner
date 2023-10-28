import QtQuick
import "qrc:/config/Colors.js" as Colors

Item {
    id: root

    property int fontSize: 12
    property bool editable: true

    function showError() {
        background.border.color = Colors.Red
    }

    function isEmpty() {
        return input.text === ""
    }

    function setText(text) {
        input.text = text
    }

    function lostFocus() {
        input.focus = false
    }

    signal textChanged(string text)

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
            enabled: root.editable

            activeFocusOnPress: true
            selectByMouse: true
            font.pointSize: root.fontSize

            onEditingFinished: input.focus = false

            onFocusChanged: {
                if (focus) {
                    background.border.color = Colors.MainAccent
                } else {
                    background.border.color = Colors.SubtleAccent
                    root.textChanged(input.text)
                }
            }
        }
    }
}
