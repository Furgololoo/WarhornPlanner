import QtQuick
import QtQuick.Effects
import CustomElements
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    height: column.implicitHeight

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: Colors.MainBGDarker
        property var component: ({})

        Component.onCompleted: mainRect.component = Qt.createComponent(
                                   "qrc:/views/elements/popup/PopupEntity.qml")

        Connections {
            target: PopupManager
            function onRaiseError(obj) {
                obj.parent = column
                obj.width = mainRect.width
                obj.height = 50
                mainRect.component.createObject(obj)
            }
        }

        Column {
            id: column
            anchors.fill: parent
            anchors.topMargin: Constants.BigMargin
            spacing: Constants.SmallMargin
        }
    }
}
