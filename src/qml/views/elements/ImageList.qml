import QtQuick
import "../custom/"
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root

    property int entitiesCount: 0
    property var component: ({})

    Component.onCompleted: {
        root.component = Qt.createComponent(
                    "qrc:/views/elements/ImageEntity.qml")
    }

    function reset() {
        for (var i = 0; i < root.entitiesCount; i++)
            column.children[i].destroy()
            root.entitiesCount = 0
    }

    function removeMe(index) {
        root.destroyEntity(index)
    }

    function lostFocus() {
        for (var i = 0; i < root.entitiesCount; i++)
            column.children[i].lostFocus()
    }

    function addEntity(attachmentUrl: string) {
        let newEntity = root.component.createObject(column)
        newEntity.setImageList(root)
        newEntity.setAttachmentName(TicketManager.addAttachment(attachmentUrl, root.entitiesCount))
        newEntity.index = root.entitiesCount
        root.entitiesCount++
    }

    function destroyEntity(index) {
        let subtractor = 0
        for (var i = 0; i < root.entitiesCount; i++) {
            if (i === index)
                subtractor++
            else
                column.children[i].index = i - subtractor
        }
        column.children[index].destroy()
        root.entitiesCount--
    }

    ScrollBar_C {
        id: scrollBar
        height: parent.height
        width: parent.width * 0.02
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: Constants.BigMargin

        visible: column.implicitHeight > flickable.height ? true : false

        onMoveToBegin: {
            flickable.contentY = 0
        }

        onMoveToEnd: {
            flickable.contentY = column.implicitHeight - flickable.height
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
        anchors.leftMargin: Constants.BigMargin
        anchors.right: (scrollBar.visible === true) ? scrollBar.left : parent.right
        anchors.rightMargin: (scrollBar.visible === true) ? Constants.BigMargin : 0
        contentHeight: column.implicitHeight
        contentWidth: flickable.width

        boundsBehavior: Flickable.StopAtBounds
        interactive: true
        clip: true

        onHeightChanged: {
            // it has to be here, scaling app causes slider bug
            scrollBar.setHandleSize(
                        column.implicitHeight / flickable.height)
        }

        onContentHeightChanged: {
            returnToBounds()
            scrollBar.setHandleSize(
                        column.implicitHeight / flickable.height)
        }

        onContentYChanged: scrollBar.moveSlider(flickable.contentY)

        Column {
            id: column
            anchors.fill: parent
            spacing: Constants.BigMargin * 2

            onImplicitHeightChanged: {
                if (column.implicitHeight === flickable.height) {
                    scrollBar.disableScrollBar()
                    flickable.width = root.width
                    flickable.contentWidth = root.width
                } else
                    scrollBar.setHandleSize(
                                column.implicitHeight / flickable.height)
            }
        }
    }
}
