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

            TicketHighlighter {
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

                    Ticket {
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

//Rectangle {
//    id: topSign
//    anchors.top: mainRect.top
//    width: parent.width //* 0.8
//    anchors.horizontalCenter: parent.horizontalCenter
//    height: 10
//    visible: false
//    color: "#FFFFFF"
//    z: 2
//}
//MultiEffect {
//    id: effect
//    visible: (flickable.contentY != 0 && column.height > flickable.height)
//    source: topSign
//    anchors.fill: topSign
//    brightness: 1
//    shadowScale: 5
//    shadowVerticalOffset: 0
//    shadowBlur: 64
//    blurEnabled: true
//    blurMax: 128
//    blur: 0.5
//}

//Rectangle {
//    id: bottomSign
//    anchors.top: mainRect.bottom
//    width: parent.width
//    anchors.horizontalCenter: parent.horizontalCenter
//    height: 10
//    visible: false
//    color: "#FFFFFF"
//    z: 2
//}
//MultiEffect {
//    visible: ((flickable.contentY + flickable.height) <= column.height && column.height > flickable.height)
//    source: bottomSign
//    anchors.fill: bottomSign
//    brightness: 1
//    shadowScale: 5
//    shadowVerticalOffset: -1
//    shadowBlur: 128
//    blurEnabled: true
//    blurMax: 128
//    blur: 1.0
//}
