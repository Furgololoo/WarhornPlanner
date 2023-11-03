import QtQuick
import QtQuick.Effects
import CustomElements
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
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
            function onRaiseNotify(obj) {
                obj.parent = column
                obj.width = root.width
                obj.height = 75
                let popup = mainRect.component.createObject(obj)
                popup.setFontPointSize(16)
                popup.setTextInCenter()
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
