import QtQuick
import QtQuick.Effects
import "../../config/Colors.js" as Colors
import "../../config/Constants.js" as Constants

Item {
    id: root

    property string title: "undefined"
    property int columnIndex: 0

    Connections {
        target: BoardManager
        function onUpdateBoard() {
            repeater.model = BoardManager.getTickets(columnIndex)

        }
    }

    Rectangle {
        id: header
        width: parent.width
        height: 45
        anchors.top: parent.top
        color: Colors.MainBGDarker

        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: title
            color: Colors.PlaceholderTextColor
            font.pointSize: 15
        }
    }

    Rectangle {
        id: mainRect
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        color: Colors.MainBG

        Flickable {
            id: flickable
            anchors.fill: parent
            contentHeight: column.implicitHeight
            contentWidth: parent.width

            boundsBehavior: Flickable.StopAtBounds
            interactive: true
            clip: true

            Highlighter {
                id: highlighter
                width: column.width
                height: column.width * 0.6
                is_visible: false
            }

            Column {
                id: column
                anchors.fill : parent
                anchors.margins: {
                    Constants.SmallMargin
                    Constants.SmallMargin
                    Constants.SmallMargin
                    Constants.SmallMargin
                }
                spacing: Constants.SmallMargin

                Repeater {
                    id: repeater
                    anchors.fill: parent

                    TicketPreview {
                        id: ticket
                        width: column.width
                        height: column.width * 0.6
                        data_json: modelData
                        onHoverBegin: highlighter.setPosition(ticket)
                        onHoverEnd: highlighter.is_visible = false
                    }
                }
            }
        }
    }
}
