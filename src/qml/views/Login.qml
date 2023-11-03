import QtQuick
import QtQuick.Controls
import "custom/"
import "elements/"
import "elements/popup"
import "../config/Colors.js" as Colors
import "../config/Constants.js" as Constants

Item {

    Rectangle {
        id: background
        anchors.fill: parent
        color: Colors.MainBGDarker

        MouseArea {
            anchors.fill: parent
            onPressed: {
                usernameInput.lostFocus()
                passwordInput.lostFocus()
            }
        }

        Highlighter {
            id: highlighter
            anchors.centerIn: mainRect
            width: mainRect.width * 0.98
            height: mainRect.height * 0.98
            is_visible: false

            function enableAnimation(enable) {
                animWidth.running = enable
                animHeight.running = enable
            }

            SequentialAnimation {
                id: animWidth
                loops: Animation.Infinite
                NumberAnimation {
                    target: highlighter
                    property: "width"
                    duration: 1000
                    to: mainRect.width * 0.8
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: highlighter
                    property: "width"
                    duration: 1000
                    to: mainRect.width
                    easing.type: Easing.InOutQuad
                }
            }
            SequentialAnimation {
                id: animHeight
                loops: Animation.Infinite
                NumberAnimation {
                    target: highlighter
                    property: "height"
                    duration: 1000
                    to: mainRect.height * 0.8
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: highlighter
                    property: "height"
                    duration: 1000
                    to: mainRect.height
                    easing.type: Easing.InOutQuad
                }
            }
        }

        Rectangle {
            id: mainRect
            anchors.centerIn: parent
            width: parent.width * 0.2
            height: parent.width * 0.2
            color: Colors.MainBGDarker
            border.width: 1
            border.color: Colors.MainAccent

            BusyIndicator {
                id: busyIndicator
                running: false
                height: 40
                anchors.top: parent.top
                anchors.topMargin: Constants.BigMargin
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: mainText
                height: 40
                anchors.top: parent.top
                anchors.topMargin: Constants.BigMargin
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "Login"
                color: Colors.TextColor
                font.pointSize: 30
                font.bold: true
            }

            Item {
                id: mainInput
                width: parent.width * 0.85
                height: parent.height * 0.5
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: mainText.bottom
                anchors.topMargin: (parent.height - mainText.height - mainInput.height) / 2

                Item {
                    id: usernameItem
                    width: parent.width
                    height: parent.height * 0.5
                    anchors.top: parent.top

                    Text {
                        id: usernameText
                        height: 25
                        anchors.left: parent.left
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        text: "Username"
                        color: Colors.TextColor
                        font.pointSize: 14
                        font.bold: true
                    }
                    TextInput_C {
                        id: usernameInput
                        anchors.top: usernameText.bottom
                        anchors.topMargin: Constants.BigMargin
                        anchors.left: parent.left
                        height: 40
                        width: parent.width
                        fontSize: 16
                    }
                }
                Item {
                    id: passwordItem
                    width: parent.width
                    height: parent.height * 0.5
                    anchors.bottom: parent.bottom

                    Text {
                        id: passwordText
                        height: 25
                        anchors.left: parent.left
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        text: "Password"
                        color: Colors.TextColor
                        font.pointSize: 14
                        font.bold: true
                    }
                    TextInput_C {
                        id: passwordInput
                        anchors.top: passwordText.bottom
                        anchors.topMargin: Constants.BigMargin
                        anchors.left: parent.left
                        height: 40
                        width: parent.width
                        fontSize: 16
                        mode: TextInput.Password
                    }
                }
            }

            Button_C {
                id: applyButton
                width: parent.width * 0.5
                height: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: Constants.BigMargin * 2
                anchors.horizontalCenter: parent.horizontalCenter
                baseText: "Login"
                fontSize: 20

                onPressedButton: {
                    Coffey.sendTestJson()
//                    if (usernameInput.isEmpty() || passwordInput.isEmpty()) {
//                        if (usernameInput.isEmpty())
//                            usernameInput.showError()
//                        if (passwordInput.isEmpty())
//                            passwordInput.showError()
//                        PopupManager.showError("Fill in all fields!", 3000)
//                    } else {
//                        highlighter.is_visible = true
//                        highlighter.enableAnimation(true)
//                        mainText.visible = false
//                        busyIndicator.running = true
//                        Coffey.login(usernameInput.text, passwordInput.text)
//                    }
                }
            }
        }
        ErrorStack {
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.8
        }
    }
}
