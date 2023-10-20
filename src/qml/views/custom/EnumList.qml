import QtQuick
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    height: 150

    property var parentComboBox: ({})

    function setEnumID(enumID: int) {
        repeater.model = TicketManager.getEnumList(enumID)
        if(enumID === 3)
            root.height = 100
    }

    function setParentComboBox(obj: ComboBox_C) {
        root.parentComboBox = obj
    }

    signal closeEnumList()

    Rectangle {
        anchors.fill: parent
        color: Colors.MainBG
        border.width: 1
        border.color: Colors.MainAccent

        Flickable {
            id: flickable
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: Constants.SmallMargin
            contentHeight: column.implicitHeight
            contentWidth: parent.width

            boundsBehavior: Flickable.StopAtBounds
            interactive: true
            clip: true

            Column {
                id: column
                anchors.fill : parent
                spacing: Constants.MediumMargin

                onImplicitHeightChanged: {
                        flickable.width = root.width
                        flickable.contentWidth = root.width
                }

                Repeater {
                    id: repeater
                    anchors.fill: parent

                    Item {
                        width: column.width
                        height: 27
                        Text {
                            id: text
                            height: 25
                            width: column.width
                            anchors.left: parent.left
                            anchors.leftMargin: Constants.BigMargin
                            verticalAlignment: Text.AlignVCenter
                            color: Colors.TextColor
                            font.pointSize: 12
                            font.bold: true
                            text: modelData
                        }
                        Rectangle {
                            anchors.top: parent.bottom
                            anchors.topMargin: 3
                            anchors.right: parent.right
                            height: 2
                            width: parent.width - 1
                            color: Colors.MainBGDarker
                            radius: 2
                        }
                        MouseArea {
                            anchors.fill: parent
                            onPressed: {
                                root.parentComboBox.selectedValue(modelData)
                                root.closeEnumList()
                            }
                        }
                    }
                }
            }
        }
    }
}

