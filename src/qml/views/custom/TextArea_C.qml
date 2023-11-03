import QtQuick
import QtQuick.Controls
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root

    property bool hasFocus: false

    function reset() {
        input.clear()
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
        hasFocus = false
        input.focus = false
    }

    function getValue() {
        return input.text
    }

    onHasFocusChanged: {
        console.log("on has focus changed to: " + hasFocus)
        background.border.color = (root.hasFocus) ? Colors.MainAccent : Colors.SubtleAccent
    }

    ScrollBar_C {
        id: scrollBar
        //        height: flickable.height
        width: parent.width * 0.012
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        visible: input.implicitHeight > flickable.height ? true : false

        onMoveToBegin: {
            flickable.contentY = 0
        }

        onMoveToEnd: {
            flickable.contentY = input.implicitHeight - flickable.height
        }

        onMoved: value => {
                     flickable.contentY += value
                 }
    }

    Flickable {
        id: flickable
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: (scrollBar.visible === true) ? scrollBar.left : parent.right
        anchors.rightMargin: (scrollBar.visible === true) ? Constants.SmallMargin : 0
        contentHeight: input.implicitHeight
        contentWidth: parent.width

        boundsBehavior: Flickable.StopAtBounds
        interactive: true
        clip: true

        onHeightChanged: {
            // it has to be here, scaling app causes slider bug
            scrollBar.setHandleSize(input.implicitHeight / flickable.height)
        }

        onContentYChanged: scrollBar.moveSlider(flickable.contentY)

        TextArea.flickable: TextArea {
            id: input
            anchors.fill: parent
            implicitWidth: root.width - 30
            //            implicitHeight: root.height > contentHeight ? root.height : contentHeight
            color: Colors.TextColor
            textFormat: TextEdit.PlainText
            activeFocusOnPress: true
            font.pointSize: 11

            onTextChanged: {
                // it has to be here, scaling app causes slider bug
                scrollBar.setHandleSize(input.implicitHeight / flickable.height)
                scrollBar.moveSlider(flickable.contentY)
                if (root.hasFocus === true
                        && background.border.color === Colors.Red)
                    background.border.color = Colors.MainAccent
            }

            onFocusChanged: {
                root.hasFocus = focus
            }

            background: Rectangle {
                id: background
                anchors.fill: parent
                color: Colors.MainBG
                border.width: 1
            }
        }
    }
}
