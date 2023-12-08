import QtQuick
import QtQuick.Effects
import QtQuick.Controls
import CustomElements
import "custom/"
import "elements/"
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    anchors.fill: parent
    property int ticketId: 0

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: Colors.MainBGDarker
    }

}
