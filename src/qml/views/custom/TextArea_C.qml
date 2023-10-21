import QtQuick
import QtQuick.Controls
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root

    property bool hasFocus: false

    function setText(text: string) {
        input.text = text
    }

    function lostFocus() {
        hasFocus = false
        input.focus = false
    }

    signal textChanged(text: string)

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

        onMoved: (value) => {
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

        onHeightChanged: {      // it has to be here, scaling app causes slider bug
            scrollBar.setHandleSize(input.implicitHeight / flickable.height)
        }

        onContentYChanged: scrollBar.moveSlider(flickable.contentY)

        TextArea.flickable: TextArea {
            id: input
            anchors.fill: parent
            implicitWidth: root.width - 30
//            implicitHeight: root.height > contentHeight ? root.height : contentHeight
            color: Colors.TextColor
            textFormat: TextEdit.RichText
            activeFocusOnPress: true

            font.pointSize: 11

            onTextChanged: {        // it has to be here, scaling app causes slider bug
                scrollBar.setHandleSize(input.implicitHeight / flickable.height)
                scrollBar.moveSlider(flickable.contentY)
            }

            onFocusChanged: {
                hasFocus = focus
            }

            background: Rectangle {
                anchors.fill: parent
                color: Colors.MainBG
                border.width: 1
                border.color: root.hasFocus ? Colors.MainAccent : Colors.SubtleAccent
            }
        }
    }
}
