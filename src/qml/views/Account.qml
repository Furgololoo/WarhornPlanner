import QtQuick
import QtQuick.Effects
import "custom/"
import "elements/"
import "../config/Colors.js" as Colors
import "../config/Constants.js" as Constants

Item {
    anchors.fill: parent

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: Colors.MainBGDarker

        Button_C {
            id: btn
            anchors.centerIn: parent
            width: 150
            height: 50
        }

        TicketLinks {
            anchors.top: btn.bottom
            anchors.left: btn.left
            width: 200
            initialHeight: 50
        }

    }
}
