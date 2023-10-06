import QtQuick
import "views/"
import "config/Colors.js" as Colors
import "config/Constants.js" as Constants

Window {
    title: qsTr("Coffey")
    width: 640
    height: 480
    visible: true

    Board {
        anchors.fill: parent
    }
}
