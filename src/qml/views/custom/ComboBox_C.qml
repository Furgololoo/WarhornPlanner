import QtQuick
import "../../config/Colors.js" as Colors
import "../../config/Constants.js" as Constants

Item {
    id: root
    height: 50

    property int enumID: 0
    property int selectedValueInt: -1

    signal openList
    signal closeList
    signal valueChanged(int value)

    function showError() {
        topRect.border.color = Colors.Red
    }

    function isSet() {
        return !(root.selectedValueInt !== -1)
    }

    function selectedValue(value, index) {
        mainText.text = value
        root.selectedValueInt = index
        topRect.border.color = Colors.SubtleAccent
        console.log("Value changed: " + index)
        valueChanged(index)
    }

    function lostFocus() {
        if (mouseArea.state) {
            icon.source = "qrc:/icons/icons/light/more.png"
            mouseArea.state = false
            topRect.destroyEnumList()
            root.closeList()
        }
    }

    Rectangle {
        id: topRect
        width: parent.width
        height: 40
        color: Colors.MainBG
        border.width: 1
        border.color: Colors.SubtleAccent
        property var component: ({})
        property var sprite: null

        function createEnumList() {
            topRect.component = Qt.createComponent(
                        "qrc:/views/custom/EnumList.qml")
            topRect.sprite = topRect.component.createObject(topRect)
            topRect.sprite.width = topRect.width
            topRect.sprite.anchors.top = topRect.bottom
            topRect.sprite.anchors.topMargin = Constants.SmallMargin
            topRect.sprite.anchors.left = topRect.left
            topRect.sprite.setEnumID(root.enumID)
            topRect.sprite.setParentComboBox(root)
        }

        function destroyEnumList() {
            if (topRect.sprite !== null) {
                topRect.sprite.destroy()
                topRect.sprite = null
                root.height -= 100
                icon.source = "qrc:/icons/icons/light/more.png"
                mouseArea.state = false
            }
        }

        Connections {
            target: topRect.sprite
            function onCloseEnumList() {
                root.closeList()
                topRect.destroyEnumList()
            }
        }

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
                if (!state) {
                    openList()
                    root.height += 100
                    topRect.createEnumList()
                    topRect.border.color = Colors.SubtleAccent
                    icon.source = "qrc:/icons/icons/light/less.png"
                    mouseArea.state = true
                } else {
                    closeList()
                    root.height -= 100
                    topRect.destroyEnumList()
                    icon.source = "qrc:/icons/icons/light/more.png"
                    mouseArea.state = false
                }
            }
        }
    }
}
