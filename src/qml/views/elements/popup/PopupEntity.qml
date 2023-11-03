import QtQuick
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    anchors.fill: parent

    function setTextInCenter() {
        mainText.horizontalAlignment = Text.AlignHCenter
    }

    function setText(text) {
        mainText.text = text
    }

    function setFontPointSize(size) {
        mainText.font.pointSize = size
    }

    Text {
        id: mainText
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: Constants.BigMargin
        anchors.right: parent.right
        anchors.rightMargin: Constants.BigMargin

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: (root.parent.baseText) ? root.parent.baseText : ""
        color: (root.parent.type === 2) ? Colors.TextColor : Colors.MainBG
        wrapMode: Text.WordWrap
        font.pointSize: 18
        font.bold: true
    }
}
