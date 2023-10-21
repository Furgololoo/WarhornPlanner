import QtQuick
import QtQuick.Effects
import QtQuick.Controls
import "custom/"
import "elements/"
import "../config/Colors.js" as Colors
import "../config/Constants.js" as Constants

Item {
    anchors.fill: parent

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: Colors.MainBGDarker
        property var component: ({})
        property var sprite: null

        function createEnumList(obj, enumID, comboBox) {
            mainRect.component = Qt.createComponent(
                        "qrc:/views/custom/EnumList.qml")
            mainRect.sprite = mainRect.component.createObject(mainRect)
            mainRect.sprite.width = obj.width
            mainRect.sprite.x = column.x
            mainRect.sprite.y = column.y + obj.y + obj.height
            mainRect.sprite.setEnumID(enumID)
            mainRect.sprite.setParentComboBox(comboBox)
        }

        function destroyEnumList() {
            if (mainRect.sprite !== null) {
                mainRect.sprite.parentComboBox.lostFocus()
                mainRect.sprite.destroy()
                mainRect.sprite = null
            }
        }

        Connections {
            target: mainRect.sprite
            function onCloseEnumList() {
                mainRect.destroyEnumList()
            }
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                titleInput.lostFocus()
                acceptanceCriteriaInput.lostFocus()
                descriptionInput.lostFocus()
                mainRect.destroyEnumList()
            }

            Text {
                id: mainText
                anchors.top: parent.top
                anchors.topMargin: Constants.BigMargin
                anchors.left: parent.left
                anchors.leftMargin: Constants.BigMargin * 2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "Create Ticket"
                color: Colors.TextColor
                font.pointSize: 20
                font.bold: true
            }

            ScrollBar_C {
                id: scrollBar
                height: parent.height
                width: parent.width * 0.012
                anchors.top: parent.top
                anchors.topMargin: Constants.BigMargin
                anchors.right: parent.right

                visible: column.implicitHeight > flickable.height ? true : false

                onMoveToBegin: {
                    flickable.contentY = 0
                }

                onMoveToEnd: {
                    flickable.contentY = column.implicitHeight - flickable.height
                }

                onMoved: value => {
                             flickable.contentY += value
                         }
            }

            Flickable {
                id: flickable
                anchors.top: mainText.bottom
                anchors.topMargin: Constants.BigMargin * 4
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: Constants.BigMargin
                width: parent.width * 0.5
                contentHeight: column.implicitHeight
                contentWidth: flickable.width

                boundsBehavior: Flickable.StopAtBounds
                interactive: true
                clip: true

                onHeightChanged: {
                    // it has to be here, scaling app causes slider bug
                    scrollBar.setHandleSize(
                                column.implicitHeight / flickable.height)
                }

                onContentYChanged: scrollBar.moveSlider(flickable.contentY)

                Column {
                    id: column
                    anchors.fill: parent
                    spacing: Constants.BigMargin * 2

                    onImplicitHeightChanged: {
                        if (column.implicitHeight === flickable.height) {
                            scrollBar.disableScrollBar()
                            flickable.width = root.width
                            flickable.contentWidth = root.width
                        } else
                            scrollBar.setHandleSize(
                                        column.implicitHeight / flickable.height)
                    }

                    Item {
                        id: titleItem
                        width: parent.width
                        height: 80
                        Text {
                            id: titleText
                            height: 25
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: Constants.BigMargin
                            verticalAlignment: Text.AlignVCenter
                            text: "Title"
                            color: Colors.TextColor
                            font.pointSize: 16
                            font.bold: true
                        }
                        TextInput_C {
                            id: titleInput
                            anchors.top: titleText.bottom
                            anchors.topMargin: Constants.BigMargin
                            anchors.left: parent.left
                            height: 50
                            width: parent.width
                            fontSize: 16
                        }
                    }

                    Item {
                        id: typeItem
                        width: parent.width
                        height: 80
                        Text {
                            id: typeText
                            height: 25
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: Constants.BigMargin
                            verticalAlignment: Text.AlignVCenter
                            text: "Type"
                            color: Colors.TextColor
                            font.pointSize: 16
                            font.bold: true
                        }
                        ComboBox_C {
                            id: typeInput
                            anchors.top: typeText.bottom
                            anchors.topMargin: Constants.BigMargin
                            anchors.left: parent.left
                            height: 50
                            width: parent.width
                            onOpenList: {
                                mainRect.createEnumList(typeItem, 3, typeInput)
                            }
                            onCloseList: {
                                mainRect.destroyEnumList()
                            }
                        }
                    }

                    Item {
                        id: acceptanceCriteriaItem
                        width: parent.width
                        height: 120
                        Text {
                            id: acceptanceCriteriaText
                            height: 25
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: Constants.BigMargin
                            verticalAlignment: Text.AlignVCenter
                            text: "Acceptance Criteria"
                            color: Colors.TextColor
                            font.pointSize: 16
                            font.bold: true
                        }
                        TextArea_C {
                            id: acceptanceCriteriaInput
                            anchors.top: acceptanceCriteriaText.bottom
                            anchors.topMargin: Constants.BigMargin
                            anchors.left: parent.left
                            height: 90
                            width: parent.width
                        }
                    }

                    Item {
                        id: descriptionItem
                        width: parent.width
                        height: 250
                        Text {
                            id: descriptionText
                            height: 25
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: Constants.BigMargin
                            verticalAlignment: Text.AlignVCenter
                            text: "Description"
                            color: Colors.TextColor
                            font.pointSize: 16
                            font.bold: true
                        }
                        TextArea_C {
                            id: descriptionInput
                            anchors.top: descriptionText.bottom
                            anchors.topMargin: Constants.BigMargin
                            anchors.left: parent.left
                            height: 220
                            width: parent.width
                        }
                    }

                    Item {
                        id: componentItem
                        width: parent.width
                        height: 80
                        Text {
                            id: componentText
                            height: 25
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: Constants.BigMargin
                            verticalAlignment: Text.AlignVCenter
                            text: "Component"
                            color: Colors.TextColor
                            font.pointSize: 16
                            font.bold: true
                        }
                        ComboBox_C {
                            id: componentInput
                            anchors.top: componentText.bottom
                            anchors.topMargin: Constants.BigMargin
                            anchors.left: parent.left
                            height: 50
                            width: parent.width
                            onOpenList: {
                                mainRect.createEnumList(componentItem, 1,
                                                        componentInput)
                            }
                            onCloseList: {
                                mainRect.destroyEnumList()
                            }
                        }
                    }

                    Item {
                        id: priorityItem
                        width: parent.width
                        height: 80
                        Text {
                            id: priorityText
                            height: 25
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: Constants.BigMargin
                            verticalAlignment: Text.AlignVCenter
                            text: "Priority"
                            color: Colors.TextColor
                            font.pointSize: 16
                            font.bold: true
                        }
                        ComboBox_C {
                            id: priorityInput
                            anchors.top: priorityText.bottom
                            anchors.topMargin: Constants.BigMargin
                            anchors.left: parent.left
                            height: 50
                            width: parent.width
                            onOpenList: {
                                mainRect.createEnumList(priorityItem, 0,
                                                        priorityInput)
                            }
                            onCloseList: {
                                mainRect.destroyEnumList()
                            }
                        }
                    }

                    Item {
                        id: statusItem
                        width: parent.width
                        height: 80
                        Text {
                            id: statusText
                            height: 25
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: Constants.BigMargin
                            verticalAlignment: Text.AlignVCenter
                            text: "Status"
                            color: Colors.TextColor
                            font.pointSize: 16
                            font.bold: true
                        }
                        ComboBox_C {
                            id: statusInput
                            anchors.top: statusText.bottom
                            anchors.topMargin: Constants.BigMargin
                            anchors.left: parent.left
                            height: 50
                            width: parent.width
                            onOpenList: {
                                mainRect.createEnumList(statusItem, 2,
                                                        statusInput)
                            }
                            onCloseList: {
                                mainRect.destroyEnumList()
                            }
                        }
                    }

                    TicketLinks {
                        id: ticketLinks
                        width: parent.width
                        initialHeight: 50
                    }
                }
            }
        }
    }
}
