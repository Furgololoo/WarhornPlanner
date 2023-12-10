import QtQuick
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    property string baseText: "undefined"
    property int fontSize: 16
    property bool editMode: false

    signal acceptedValue(text: string)

    function lostFocus() {
        input.lostFocus()
        root.editMode = false
    }

    Text {
        id: label
        anchors.fill: parent
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        text: root.baseText
        color: Colors.TextColor
        font.pointSize: root.fontSize
        visible: !root.editMode
        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.editMode = true
                input.setText(root.baseText)
            }
        }
    }

    TextInput_C {
        id: input
        anchors.fill: parent
        fontSize: root.fontSize
        visible: root.editMode

    }

    Image {
        id: closeIcon
        source: "qrc:/icons/icons/light/close.png"
        anchors.left: input.right
        anchors.leftMargin: Constants.BigMargin * 2
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height * 0.8
        width: parent.height * 0.8
        visible: root.editMode

        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.editMode = false
            }
        }
    }

    Image {
        id: doneIcon
        source: "qrc:/icons/icons/light/done.png"
        anchors.left: closeIcon.right
        anchors.leftMargin: Constants.BigMargin
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height * 0.8
        width: parent.height * 0.8
        visible: root.editMode

        MouseArea {
            anchors.fill: parent
            onClicked: {
                // send change user name request
                if(input.isEmpty()) {
                    input.showError()
                }
                else {
                    root.acceptedValue(input.getValue())
                    root.baseText = input.getValue()
                    root.editMode = false
                }
            }
        }
    }

}
