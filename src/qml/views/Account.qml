import QtQuick
import QtQuick.Effects
import CustomElements
import "custom/"
import "elements/"
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    anchors.fill: parent

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: Colors.MainBGDarker
        property var component: ({})

        //        Connections {
        //            target: PopupManager
        //            function onRaiseError(obj) {
        //                obj.parent = column
        //                obj.width = parent.width
        //                obj.height = 50
        //                mainRect.component.createObject(obj)
        //            }
        //        }

        Component.onCompleted: {
            var user_info = Coffey.getUserInfo()
            userNameText.text = user_info["user_name"]
            loginText.text = user_info["login"]
            repeater.model = user_info["user_roles"]
        }


        ScrollBar_C {
            id: scrollBar
            height: flickable.height
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

            onMoved: (value) => {
                         flickable.contentY += value
                     }
        }

        Flickable {
            id: flickable
            anchors.top: parent.top
            anchors.topMargin: Constants.BigMargin
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: Constants.BigMargin * 2
            anchors.right: (scrollBar.visible === true) ? scrollBar.left : parent.right
            anchors.rightMargin: Constants.SmallMargin
            contentHeight: column.implicitHeight
            contentWidth: parent.width

            boundsBehavior: Flickable.StopAtBounds
            interactive: true
            clip: true

            onHeightChanged: {      // it has to be here, scaling app causes slider bug
                scrollBar.setHandleSize(column.implicitHeight / flickable.height)
            }

            onContentYChanged: scrollBar.moveSlider(flickable.contentY)

            Column {
                id: column
                anchors.fill: parent
                spacing: Constants.BigMargin

                onImplicitHeightChanged: {
                    if(column.implicitHeight === flickable.height) {
                        scrollBar.disableScrollBar()
                        flickable.width = root.width
                        flickable.contentWidth = root.width
                    }
                    else
                        scrollBar.setHandleSize(column.implicitHeight / flickable.height)
                }

                Item {
                    id: userNameItem
                    width: parent.width
                    height: root.height * 0.04

                    property bool enableEdit: false

                    Text {
                        id: userNameLbl
                        height: parent.height
                        anchors.left: parent.left
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        text: "User name:"
                        color: Colors.TextColor
                        font.pointSize: 16
                        font.bold: true
                    }
                    Text {
                        id: userNameText
                        anchors.top: userNameLbl.top
                        anchors.left: userNameLbl.right
                        anchors.leftMargin: Constants.BigMargin * 2
                        height: userNameLbl.height
                        width: parent.width * 0.1
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        text: "Not set"
                        color: Colors.TextColor
                        font.pointSize: 16
                        font.bold: true
                        visible: !userNameItem.enableEdit
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                userNameItem.enableEdit = true
                            }
                        }
                    }
                    TextInput_C {
                        id: userNameInput
                        anchors.top: userNameLbl.top
                        anchors.left: userNameLbl.right
                        anchors.leftMargin: Constants.BigMargin * 2
                        height: userNameLbl.height
                        width: parent.width * 0.1
                        fontSize: 16
                        visible: userNameItem.enableEdit
                    }

                    Image {
                        id: userNameCloseIcon
                        source: "qrc:/icons/icons/light/close.png"
                        anchors.left: userNameText.right
                        anchors.leftMargin: Constants.BigMargin * 2
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height * 0.8
                        width: parent.height * 0.8
                        visible: userNameItem.enableEdit

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                userNameItem.enableEdit = false
                            }
                        }
                    }

                    Image {
                        id: userNameDoneIcon
                        source: "qrc:/icons/icons/light/done.png"
                        anchors.left: userNameCloseIcon.right
                        anchors.leftMargin: Constants.BigMargin
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height * 0.8
                        width: parent.height * 0.8
                        visible: userNameItem.enableEdit

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                // send change user name request
                                userNameItem.enableEdit = false
                            }
                        }
                    }

                }

                Rectangle {
                    color: Colors.SubtleAccent
                    width: parent.width * 0.25
                    height: 2
                    radius: 2
                }

                Item {
                    id: loginItem
                    width: parent.width
                    height: root.height * 0.04

                    property bool enableEdit: false

                    Text {
                        id: loginLbl
                        height: parent.height
                        anchors.left: parent.left
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        text: "Login:"
                        color: Colors.TextColor
                        font.pointSize: 16
                        font.bold: true
                    }
                    Text {
                        id: loginText
                        anchors.top: loginLbl.top
                        anchors.left: loginLbl.right
                        anchors.leftMargin: Constants.BigMargin * 2
                        height: loginLbl.height
                        width: parent.width * 0.1
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        text: "Not set"
                        color: Colors.TextColor
                        font.pointSize: 16
                        font.bold: true
                        visible: !loginItem.enableEdit
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                loginItem.enableEdit = true
                            }
                        }
                    }
                    TextInput_C {
                        id: loginInput
                        anchors.top: loginLbl.top
                        anchors.left: loginLbl.right
                        anchors.leftMargin: Constants.BigMargin * 2
                        height: loginLbl.height
                        width: parent.width * 0.1
                        fontSize: 16
                        visible: loginItem.enableEdit
                    }

                    Image {
                        id: loginCloseIcon
                        source: "qrc:/icons/icons/light/close.png"
                        anchors.left: loginText.right
                        anchors.leftMargin: Constants.BigMargin * 2
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height * 0.8
                        width: parent.height * 0.8
                        visible: loginItem.enableEdit

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                loginItem.enableEdit = false
                            }
                        }
                    }

                    Image {
                        id: loginDoneIcon
                        source: "qrc:/icons/icons/light/done.png"
                        anchors.left: loginCloseIcon.right
                        anchors.leftMargin: Constants.BigMargin
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height * 0.8
                        width: parent.height * 0.8
                        visible: loginItem.enableEdit

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                // send change user name request
                                loginItem.enableEdit = false
                            }
                        }
                    }
                }

                Rectangle {
                    color: Colors.SubtleAccent
                    width: parent.width * 0.25
                    height: 2
                    radius: 2
                }

                ChangePassword {
                    fixedHeight: root.height * 0.04
                    width: parent.width * 0.2
                }

                Item {
                    width: 100
                    height: Constants.BigMargin
                }

                Rectangle {
                    color: Colors.SubtleAccent
                    width: parent.width * 0.25
                    height: 2
                    radius: 2
                }

                Column {
                    id: roleColumn
                    width: parent.width * 0.25
                    height: childrenRect.height
                    spacing: Constants.BigMargin

                    Repeater {
                        id: repeater

                        Text {
                            id: roleTxt
                            height: column.height * 0.04
                            width: parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            color: Colors.TextColor
                            font.pointSize: 16
                            font.bold: true

                            text: modelData
                        }
                    }
                }

                Rectangle {
                    color: Colors.SubtleAccent
                    width: parent.width * 0.25
                    height: 2
                    radius: 2
                }

                Text {
                    height: root.height * 0.02
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    text: "Your color"
                    color: Colors.TextColor
                    font.pointSize: 14
                    font.bold: true
                }

                ColorSelection_C {
                    width: parent.width * 0.2
                    partHeight: root.height * 0.04
                    selectedColor: Colors.MainAccent
                }

                Rectangle {
                    color: Colors.SubtleAccent
                    width: parent.width * 0.25
                    height: 2
                    radius: 2
                }

                Text {
                    height: root.height * 0.02
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    text: "Other users color"
                    color: Colors.TextColor
                    font.pointSize: 14
                    font.bold: true
                }

                ColorSelection_C {
                    width: parent.width * 0.2
                    partHeight: root.height * 0.04
                    selectedColor: Colors.PlaceholderTextColor
                }

                Rectangle {
                    color: Colors.SubtleAccent
                    width: parent.width * 0.25
                    height: 2
                    radius: 2
                }

                Text {
                    height: root.height * 0.02
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    text: "App main accent"
                    color: Colors.TextColor
                    font.pointSize: 14
                    font.bold: true
                }

                ColorSelection_C {
                    width: parent.width * 0.2
                    partHeight: root.height * 0.04
                    selectedColor: Colors.MainAccent
                    onSelected: function(selectedColor) {
                        Colors.MainAccent = selectedColor
                    }
                }
            }
        }
    }
}
