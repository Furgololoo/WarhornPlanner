import QtQuick
import QtQuick.Effects
import "custom/"
import "../config/Colors.js" as Colors
import "../config/Constants.js" as Constants

Item {
    anchors.fill: parent

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: Colors.MainBGDarker

        ScrollBar_C {
            id: scrollBar
            height: flickable.height
            width: parent.width * 0.012
            anchors.top: parent.top
            anchors.topMargin: Constants.BigMargin
            anchors.right: parent.right

            visible: column.implicitHeight > flickable.height ? true : false

            onMoveToBegin: {
                flickable.contentY = 0
            }

            onMoveToEnd: {
                flickable.contentY = column.implicitHeight - flickable.height
            }

            onMoved: (value) => {
                         flickable.contentY += value
                     }
        }

        Flickable {
            id: flickable
            anchors.top: parent.top
            anchors.topMargin: Constants.BigMargin
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: (scrollBar.visible === true) ? scrollBar.left : parent.right
            anchors.rightMargin: Constants.SmallMargin
            contentHeight: column.implicitHeight
            contentWidth: parent.width

            boundsBehavior: Flickable.StopAtBounds
            interactive: true
            clip: true

            onHeightChanged: {      // it has to be here, scaling app causes slider bug
                scrollBar.setHandleSize(column.implicitHeight / flickable.height)
            }

            onContentYChanged: scrollBar.moveSlider(flickable.contentY)

            Column {
                id: column
                anchors.fill : parent
                spacing: Constants.MediumMargin

                onImplicitHeightChanged: {
                    if(column.implicitHeight === flickable.height) {
                        scrollBar.disableScrollBar()
                        flickable.width = root.width
                        flickable.contentWidth = root.width
                    }
                    else
                        scrollBar.setHandleSize(column.implicitHeight / flickable.height)
                }

                Repeater {
                    id: repeater
                    anchors.fill: parent
                    model: 7

                    DropDown {
                        id: ticket
                        width: column.width
                        //                        data_json: modelData
                        //                        onHoverBegin: highlighter.setPosition(ticket)
                        //                        onHoverEnd: highlighter.is_visible = false
                    }
                }
            }
        }

    }
}
