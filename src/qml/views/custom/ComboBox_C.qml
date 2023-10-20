import QtQuick
import "../../config/Colors.js" as Colors
import "../../config/Constants.js" as Constants

Item {
    id: root
    height: 40

    signal openList()
    signal closeList()

    function selectedValue(value) {
        mainText.text = value
    }

    function lostFocus() {
        icon.source = "qrc:/icons/icons/light/more.png"
        mouseArea.state = false
    }

    Rectangle {
        id: topRect
        width: parent.width
        height: 40
        color: Colors.SubtleAccent
        property var component: ({})
        property var sprite: ({})

        Image {
            id: icon
            anchors.right: parent.right
            anchors.rightMargin: Constants.BigMargin
            anchors.verticalCenter: parent.verticalCenter
            width: sourceSize.width - 8
            height: sourceSize.height - 8
            source: "qrc:/icons/icons/light/more.png"
        }

        Text {
            id: mainText
            anchors.left: parent.left
            anchors.leftMargin: Constants.BigMargin * 2
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: "Select..."
            color: Colors.TextColor
            font.pointSize: 14
            elide: Text.ElideRight
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            property bool state: false

            onClicked: {
                if(!state) {
                    openList()
                    icon.source = "qrc:/icons/icons/light/less.png"
                    mouseArea.state = true
                }
                else {
                    closeList()
                    icon.source = "qrc:/icons/icons/light/more.png"
                    mouseArea.state = false
                }
            }
        }
    }
}
