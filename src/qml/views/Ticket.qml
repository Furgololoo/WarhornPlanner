import QtQuick
import QtQuick.Effects
import QtQuick.Controls
import CustomElements
import "custom/"
import "elements/"
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    anchors.fill: parent
    property int ticketId: 0

    Connections {
        target: TicketManager
        function onOpenTicketView() {
            ticketNameText.text = TicketManager.getTicketName()
        }
    }

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: Colors.MainBGDarker

        MouseArea {
            anchors.fill: parent
            onPressed: {
                console.log("asddas")
                titleInput.lostFocus()
                //                typeInput.lostFocus()
                //                acceptanceCriteriaInput.lostFocus()
                //                descriptionInput.lostFocus()
                //                componentInput.lostFocus()
                //                statusInput.lostFocus()
                //                priorityInput.lostFocus()
                //                ticketLinks.lostFocus()
                //                imageList.lostFocus()
            }
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
            anchors.top: parent.top
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
                spacing: Constants.BigMargin

                onImplicitHeightChanged: {
                    if (column.implicitHeight === flickable.height) {
                        scrollBar.disableScrollBar()
                        flickable.width = root.width
                        flickable.contentWidth = root.width
                    } else
                        scrollBar.setHandleSize(
                                    column.implicitHeight / flickable.height)
                }

                Text {
                    id: ticketNameText
                    height: root.height * 0.05
                    width: parent.width
                    anchors.leftMargin: Constants.BigMargin
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    text: "Ticket TW-259"
                    color: Colors.TextColor
                    font.pointSize: 16
                    font.bold: true
                }


                Text {
                    id: titleText
                    height: root.height * 0.05
                    width: parent.width
                    anchors.leftMargin: Constants.BigMargin
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    text: "Title aaauuu"
                    color: Colors.TextColor
                    font.pointSize: 20
                    font.bold: true
                }

                TextSeparator {
                    baseText: "Ticket details"
                    fontSize: 12
                    width: parent.width * 0.98
                    height: 30
                }

                TicketDetails {
                    width: parent.width
                    fixedHeight: root.height * 0.05
                }

            }

        }
    }
}
