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

        Button_C {
            anchors.centerIn: parent
            width: 150
            height: 50
        }
    }
}
