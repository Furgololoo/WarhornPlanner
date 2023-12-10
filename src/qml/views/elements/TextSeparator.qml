import QtQuick
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    property string baseText: "undefined"
    property int fontSize: 16

    Text {
        id: label
        anchors.fill: parent
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        text: root.baseText
        color: Colors.TextColor
        font.pointSize: root.fontSize
        font.bold: true
    }

    Rectangle {
        height: 2
        radius: 2
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: label.paintedWidth + Constants.BigMargin
        color: Colors.TextColor
    }
}
