import QtQuick
import "../custom/"
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    height: initialHeight

    property int initialHeight: 40

    Rectangle {
        id: mainRect
        width: root.width
        height: initialHeight
        color: "red"//Colors.MainBGDarker

        function addLink() {
            let newLink = ticketLink.createObject(column)
        }

        function destroyLink(index: int) {
            column.children[index].destroy()
        }

        Item {
            id: basicView
            anchors.top: mainRect.top
            width: parent.width
            height: root.initialHeight

            Button_C {
                anchors.fill: parent
                onPressedButton: mainRect.addLink()
                baseText: qsTr("Add Link")
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
                spacing: Constants.SmallMargin
                                                                                 // TODO: remove this buffer
                onHeightChanged: root.height = column.height + root.initialHeight + 30  // buffer
            }
        }

        Component {
            id: ticketLink
            Rectangle {
                width: parent.width
                height: 50
                color: "blue"
            }
        }
    }
}
