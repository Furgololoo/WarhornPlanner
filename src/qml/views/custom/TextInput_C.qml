import QtQuick
import "qrc:/config/Colors.js" as Colors

Item {
    id: root

    property int fontSize: 12
    property bool editable: true
    property int mode: TextInput.Normal

    signal textChanged(text: string)

    function reset() {
        input.text = ""
        input.focus = false
    }

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

    function getValue() {
        return input.text
    }

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
            echoMode: root.mode

            activeFocusOnPress: true
            selectByMouse: true
            font.pointSize: root.fontSize

            onEditingFinished: {
                root.textChanged(input.text)
                input.focus = false
            }

//            onTextChanged: root.textChanged(input.text)

            onFocusChanged: {
                if (focus) {
                    background.border.color = Colors.MainAccent
                } else {
                    background.border.color = Colors.SubtleAccent
                }
            }
        }
    }
}
