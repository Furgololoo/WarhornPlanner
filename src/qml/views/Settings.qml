import QtQuick
import QtQuick.Effects
import "../config/Colors.js" as Colors
import "../config/Constants.js" as Constants

Item {
    anchors.fill: parent
    property var component: []
    property var sprite: []

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: Colors.MainBGDarker

//        function showHighlight() {
//            component = Qt.createComponent("qrc:/views/elements/TicketHighlighter.qml");
//            sprite = component.createObject(box);
//            sprite.width = box.width
//            sprite.height = box.height
//            sprite.anchors.centerIn = box
//        }

//        function hideHighlight() {
//            sprite.destroy()
//        }


                Rectangle {
                    id: redSign
                    anchors.centerIn: parent
                    width: 100
                    height: 100
                    anchors.horizontalCenter: parent.horizontalCenter
                    visible: false
                    color: Colors.Blue
                }
                MultiEffect {
                    id: effect
                    source: redSign
                    anchors.fill: redSign
                    brightness: 0.4
                    saturation: 0.2
                    blurEnabled: true
                    blurMax: 128
                    blur: 1.0
                }

//        MouseArea {
//            anchors.fill: parent
//            hoverEnabled: true
//            onHoveredChanged: {
//                if(containsMouse)
//                    mainRect.showHighlight()
//                else
//                    mainRect.hideHighlight()
//            }
//        }

//        Item {
//            id: redSign
//            anchors.centerIn: parent
//            width: 100
//            height: 100
//        }

        Rectangle {
            width: 100
            height: 100
            color: Colors.MainBG
            anchors.top: redSign.top
            anchors.right: redSign.left
            anchors.rightMargin: 10

            Rectangle {
                width: 100
                height: 100
                color: Colors.MainBG
                anchors.bottom: parent.top
                anchors.right: parent.right
                anchors.bottomMargin: 10
            }

            Rectangle {
                width: 100
                height: 100
                color: Colors.MainBG
                anchors.top: parent.top
                anchors.left: parent.right
                anchors.leftMargin: 10
            }
        }

        Rectangle {
            width: 100
            height: 100
            color: Colors.MainBG
            anchors.bottom: redSign.top
            anchors.left: redSign.left
            anchors.bottomMargin: 10

            Rectangle {
                width: 100
                height: 100
                color: Colors.MainBG
                anchors.top: parent.top
                anchors.left: parent.right
                anchors.leftMargin: 10
            }
        }

        Rectangle {
            width: 100
            height: 100
            color: Colors.MainBG
            anchors.top: redSign.top
            anchors.left: redSign.right
            anchors.leftMargin: 10

            Rectangle {
                width: 100
                height: 100
                color: Colors.MainBG
                anchors.top: parent.bottom
                anchors.right: parent.right
                anchors.topMargin: 10
            }
        }

        Rectangle {
            width: 100
            height: 100
            color: Colors.MainBG
            anchors.top: redSign.bottom
            anchors.left: redSign.left
            anchors.topMargin: 10

            Rectangle {
                width: 100
                height: 100
                color: Colors.MainBG
                anchors.top: parent.top
                anchors.right: parent.left
                anchors.rightMargin: 10
            }
        }
    }
}
