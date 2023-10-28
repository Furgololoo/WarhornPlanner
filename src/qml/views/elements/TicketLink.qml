import QtQuick
import "../custom/"
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    width: parent.width
    height: 100

    property var ticketLinks: ({})
    property int index: 0

    function setTicketLinks(obj: TicketLinks) {
        root.ticketLinks = obj
    }

    function lostFocus() {
        linkedTypeInput.lostFocus()
        ticketInput.lostFocus()
    }

    MouseArea {
        anchors.fill: parent
        onPressed: lostFocus()
    }

    Text {
        id: linkedTypeText
        height: 40
        width: 100
        anchors.top: parent.top
        anchors.left: parent.left
        verticalAlignment: Text.AlignVCenter
        text: "Link Type"
        color: Colors.TextColor
        font.pointSize: 16
        font.bold: true
    }

    TextInput_C {
        id: linkedTypeInput
        anchors.top: parent.top
        anchors.left: linkedTypeText.right
        anchors.leftMargin: Constants.BigMargin * 6
        height: 40
        width: parent.width * 0.5
        fontSize: 14
        onTextChanged: function(type) { TicketManager.updateLink(type, null, root.index) }
    }

    Text {
        id: ticketText
        height: 40
        width: 100
        anchors.top: linkedTypeText.bottom
        anchors.topMargin: Constants.SmallMargin
        anchors.left: parent.left
        verticalAlignment: Text.AlignVCenter
        text: "Ticket"
        color: Colors.TextColor
        font.pointSize: 16
        font.bold: true
    }

    TextInput_C {
        id: ticketInput
        anchors.top: ticketText.top
        anchors.topMargin: Constants.SmallMargin
        anchors.left: linkedTypeInput.left
        height: 40
        width: parent.width * 0.5
        fontSize: 14
        onTextChanged: function(ticket) { TicketManager.updateLink(null, ticket, root.index) }
    }

    Item {
        id: iconItem
        anchors.left: linkedTypeInput.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Image {
            anchors.centerIn: parent
            width: sourceSize.width + 15
            height: sourceSize.height + 15
            source: "qrc:/icons/icons/colors/close.png"

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    root.ticketLinks.removeMe(root.index)
                }
            }
        }
    }
}
