import QtCore
import QtQuick
import QtQuick.Effects
import QtQuick.Controls
import QtQuick.Dialogs
import "custom/"
import "elements/"
import "../config/Colors.js" as Colors
import "../config/Constants.js" as Constants

Item {
    id: root
    anchors.fill: parent

    Component.onCompleted: TicketManager.createTicket()

    Connections {
        target: TicketManager
        function onResetTicketView() {
            titleInput.reset()
            typeInput.reset()
            acceptanceCriteriaInput.reset()
            descriptionInput.reset()
            componentInput.reset()
            priorityInput.reset()
            ticketLinks.reset()
            imageList.reset()
        }

        function onGetData() {
            TicketManager.setTitle(titleInput.getValue())
            TicketManager.setType(typeInput.getValue())
            TicketManager.setAcceptanceCriteria(acceptanceCriteriaInput.getValue())
            TicketManager.setDescription(descriptionInput.getValue())
            TicketManager.setComponent(componentInput.getValue())
            TicketManager.setPriority(priorityInput.getValue())
        }
    }

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: Colors.MainBGDarker

        MouseArea {
            anchors.fill: parent
            onPressed: {
                titleInput.lostFocus()
                typeInput.lostFocus()
                acceptanceCriteriaInput.lostFocus()
                descriptionInput.lostFocus()
                componentInput.lostFocus()
                statusInput.lostFocus()
                priorityInput.lostFocus()
                ticketLinks.lostFocus()
                imageList.lostFocus()
            }
        }

        Item {
            id: mainItem
            anchors.top: parent.top
            anchors.bottom: saveButton.top
            anchors.bottomMargin: Constants.BigMargin
            anchors.left: parent.left
            width: parent.width * 0.5

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
                width: parent.width * 0.02
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
                anchors.leftMargin: Constants.BigMargin + 1
                anchors.right: (scrollBar.visible === true) ? scrollBar.left : parent.right
                anchors.rightMargin: (scrollBar.visible === true) ? Constants.BigMargin : 0
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

                onContentHeightChanged: {
                    returnToBounds()
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
                            width: parent.width
                            enumID: 3
                            onOpenList: {
                                typeItem.height += 100
                            }
                            onCloseList: {
                                typeItem.height -= 100
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
                            width: parent.width
                            enumID: 1
                            onOpenList: {
                                componentItem.height += 150
                            }
                            onCloseList: {
                                componentItem.height -= 150
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
                            width: parent.width
                            enumID: 0
                            onOpenList: {
                                priorityItem.height += 150
                            }
                            onCloseList: {
                                priorityItem.height -= 150
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
                            width: parent.width
                            enumID: 2
                            enabled: false
                            onOpenList: {
                                statusItem.height += 150
                            }
                            onCloseList: {
                                statusItem.height -= 150
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

        Item {
            id: imageItem
            anchors.top: parent.top
            anchors.bottom: saveButton.top
            anchors.bottomMargin: Constants.BigMargin
            anchors.right: parent.right
            width: parent.width * 0.5

            Image {
                id: image
                anchors.top: parent.top
                anchors.topMargin: Constants.BigMargin * 4
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.3
                height: parent.width * 0.3

                source: "qrc:/icons/icons/light/add_image2.png"

                MouseArea {
                    anchors.fill: parent
                    onPressed: fileDialog.open()
                }

                FileDialog {
                    id: fileDialog
                    title: "Select an attachment"
                    currentFolder: StandardPaths.writableLocation(
                                       StandardPaths.DownloadLocation)
                    onAccepted: imageList.addEntity(selectedFile)
                }
            }

            ImageList {
                id: imageList
                anchors.top: image.bottom
                anchors.topMargin: Constants.BigMargin * 4
                anchors.bottom: parent.bottom
                width: parent.width
            }
        }

        Button_C {
            id: saveButton
            anchors.left: parent.left
            anchors.leftMargin: Constants.BigMargin
            anchors.right: parent.right
            anchors.rightMargin: Constants.BigMargin
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Constants.BigMargin
            height: parent.height * 0.05
            baseText: "Save"
            fontSize: 32

            onPressedButton: {
                if (root.isValid()) {
                    TicketManager.saveTicket()
                    PopupManager.showNotify("Ticket Created Succesfully!")
                } else {
                    PopupManager.showError("All text fields should be completed!")
                }
            }
        }
    }

    function isValid() {
        let isOk = true
        if (titleInput.isEmpty()) {
            titleInput.showError()
            isOk = false
        }
        if (typeInput.isSet()) {
            typeInput.showError()
            isOk = false
        }
        if (acceptanceCriteriaInput.isEmpty()) {
            acceptanceCriteriaInput.showError()
            isOk = false
        }
        if (descriptionInput.isEmpty()) {
            descriptionInput.showError()
            isOk = false
        }
        if (componentInput.isSet()) {
            componentInput.showError()
            isOk = false
        }
        if (priorityInput.isSet()) {
            priorityInput.showError()
            isOk = false
        }
        return isOk
    }
}
