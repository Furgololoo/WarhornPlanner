import QtQuick
import "elements/"
import "../config/Colors.js" as Colors
import "../config/Constants.js" as Constants

Item {
    id: root
    anchors.fill: parent
    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: Colors.MainBGDarker

        Row {
            id: row
            anchors.fill: parent
            spacing: Constants.MediumMargin
            property int namesCount: BoardManager.getTicketColListSize()
            Repeater {
                id: repeater
                model: BoardManager.getTicketColList()
                TicketCol {
                    title: model.modelData
                    height: parent.height
                    width: parent.width/row.namesCount - Constants.MediumMargin
                    columnIndex: model.index
                }
            }
        }
//        Component.onCompleted: BoardManager.showTickets()
    }
}
