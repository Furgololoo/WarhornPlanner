import QtQuick
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    anchors.fill: parent

    function setText(text) {
        mainText.text = text
    }

    Component.onDestruction: console.log("destroying popup")

    Text {
        id: mainText
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: Constants.BigMargin
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        text: (root.parent.baseText !== null) ? root.parent.baseText : ""
        color: Colors.MainBGDarker
        elide: Text.ElideRight
        font.pointSize: 18
        font.bold: true
    }

//    Image {
//        anchors.right: parent.right
//        anchors.rightMargin: Constants.BigMargin * 2
//        anchors.verticalCenter: parent.verticalCenter
//        width: sourceSize.width + 15
//        height: sourceSize.height + 15
//        source: "qrc:/icons/icons/dark/close.png"

//        MouseArea {
//            anchors.fill: parent
//            onPressed: {
//                root.parent.close()
//            }
//        }
//    }
}
