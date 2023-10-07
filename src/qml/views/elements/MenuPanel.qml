import QtQuick
import "../../config/Colors.js" as Colors
import "../../config/Constants.js" as Constants


Item {
    id: root
    width: 40

    property bool is_open: false
    property int icon_width: 0

    Rectangle {
        anchors.fill: parent
        color: Colors.MainBG

        Component.onCompleted: icon_width = parent.width

        Image {
            id: menuImg
            visible: !is_open
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/icons/icons/light/menu.png"
        }

        // Board
        Rectangle {
            id: boardButton
            anchors.top: menuImg.bottom
            anchors.topMargin: Constants.BigMargin * 4
            anchors.left: parent.left
            anchors.right: parent.right
            height: (icon_width * 1.5) - 3
            color: Colors.MainBG

            Image {
                id: boardImg
                source: "qrc:/icons/icons/light/board.png"
                anchors.left: parent.left
                anchors.leftMargin: Constants.MediumMargin
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                anchors.bottom: boardImg.bottom
                anchors.left: boardImg.right
                anchors.leftMargin: Constants.BigMargin
                visible: is_open
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "Board"
                color: Colors.TextColor
                font.pointSize: 15
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    if(containsMouse)
                        boardButton.color = Colors.MainBGDarker
                    else
                        boardButton.color = Colors.MainBG
                }
            }
        }

        // Backlog
        Rectangle {
            id: backlogButton
            anchors.top: boardButton.bottom
            anchors.topMargin: Constants.BigMargin * 1
            anchors.left: parent.left
            anchors.right: parent.right
            height: (icon_width * 1.5) - 3
            color: Colors.MainBG

            Image {
                id: backlogImg
                source: "qrc:/icons/icons/light/backlog.png"
                anchors.left: parent.left
                anchors.leftMargin: Constants.MediumMargin
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                anchors.bottom: backlogImg.bottom
                anchors.left: backlogImg.right
                anchors.leftMargin: Constants.BigMargin
                visible: is_open
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "Backlog"
                color: Colors.TextColor
                font.pointSize: 15
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    if(containsMouse)
                        backlogButton.color = Colors.MainBGDarker
                    else
                        backlogButton.color = Colors.MainBG
                }
            }
        }

        // Create Issue
        Rectangle {
            id: createTicketButton
            anchors.top: backlogButton.bottom
            anchors.topMargin: Constants.BigMargin * 1
            anchors.left: parent.left
            anchors.right: parent.right
            height: (icon_width * 1.5) - 3
            color: Colors.MainBG

            Image {
                id: createTicketImg
                source: "qrc:/icons/icons/light/add.png"
                anchors.left: parent.left
                anchors.leftMargin: Constants.MediumMargin
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                anchors.bottom: createTicketImg.bottom
                anchors.left: createTicketImg.right
                anchors.leftMargin: Constants.BigMargin
                visible: is_open
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "Create Ticket"
                color: Colors.TextColor
                font.pointSize: 15
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    if(containsMouse)
                        createTicketButton.color = Colors.MainBGDarker
                    else
                        createTicketButton.color = Colors.MainBG
                }
            }
        }

        // Account
        Rectangle {
            id: accountButton
            anchors.top: createTicketButton.bottom
            anchors.topMargin: Constants.BigMargin * 1
            anchors.left: parent.left
            anchors.right: parent.right
            height: (icon_width * 1.5) - 3
            color: Colors.MainBG

            Image {
                id: accountImg
                source: "qrc:/icons/icons/light/account.png"
                anchors.left: parent.left
                anchors.leftMargin: Constants.MediumMargin
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                anchors.bottom: accountImg.bottom
                anchors.left: accountImg.right
                anchors.leftMargin: Constants.BigMargin
                visible: is_open
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "Account"
                color: Colors.TextColor
                font.pointSize: 15
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    if(containsMouse)
                        accountButton.color = Colors.MainBGDarker
                    else
                        accountButton.color = Colors.MainBG
                }
            }
        }

        // Settings
        Rectangle {
            id: settingsButton
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Constants.BigMargin * 1
            anchors.left: parent.left
            anchors.right: parent.right
            height: (icon_width * 1.5) - 3
            color: Colors.MainBG

            Image {
                id: settingsImg
                source: "qrc:/icons/icons/light/settings.png"
                anchors.left: parent.left
                anchors.leftMargin: Constants.MediumMargin
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                anchors.bottom: settingsImg.bottom
                anchors.left: settingsImg.right
                anchors.leftMargin: Constants.BigMargin
                visible: is_open
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "Settings"
                color: Colors.TextColor
                font.pointSize: 15
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    if(containsMouse)
                        settingsButton.color = Colors.MainBGDarker
                    else
                        settingsButton.color = Colors.MainBG
                }
            }
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                if(!is_open)
                    root.width = 175
                else
                    root.width = 40
                is_open = !is_open
                BoardManager.setup()
            }
        }
    }
}


