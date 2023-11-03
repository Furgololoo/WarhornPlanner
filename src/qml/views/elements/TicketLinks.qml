import QtQuick
import "../custom/"
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    height: initialHeight

    property int initialHeight: 40
    property var component: ({})

    function reset() {
        for (var i = 0; i < mainRect.linksCount; i++)
            column.children[i].destroy()
            mainRect.linksCount = 0
    }

    function removeMe(index) {
        mainRect.destroyLink(index)
        TicketManager.removeLink(index)
    }

    function lostFocus() {
        for (var i = 0; i < mainRect.linksCount; i++)
            column.children[i].lostFocus()
    }

    Component.onCompleted: {
        root.component = Qt.createComponent(
                    "qrc:/views/elements/TicketLink.qml")
    }

    Rectangle {
        id: mainRect
        width: root.width
        height: initialHeight
        color: Colors.MainBGDarker
        property int linksCount: 0

        function addLink() {
            let newLink = root.component.createObject(column)
            newLink.setTicketLinks(root)
            newLink.index = mainRect.linksCount
            TicketManager.addLink("", "", mainRect.linksCount)
            mainRect.linksCount++
        }

        function destroyLink(index) {
            let subtractor = 0
            for (var i = 0; i < mainRect.linksCount; i++) {
                if (i === index)
                    subtractor++
                else
                    column.children[i].index = i - subtractor
            }
            column.children[index].destroy()
            mainRect.linksCount--
        }

        Item {
            id: basicView
            anchors.top: mainRect.top
            width: parent.width
            height: root.initialHeight

            Button_C {
                anchors.fill: parent
                onPressedButton: mainRect.addLink()
                baseText: "Add Link"
            }
        }

        Item {
            id: additionalView
            anchors.top: basicView.bottom
            anchors.topMargin: Constants.BigMargin
            width: parent.width

            Column {
                id: column
                width: parent.width
                height: column.contentHeight
                spacing: Constants.BigMargin * 2
                // TODO: remove this buffer
                onHeightChanged: root.height = column.height + root.initialHeight + 30 // buffer
            }
        }
    }
}
