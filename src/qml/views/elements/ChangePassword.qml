import QtQuick
import QtQuick.Controls
import "../custom/"
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

//dodaj cos takiego jak request ID.
//network manager nie powinien trzymac tylko ejdnego requestu ale kilka
//i po IDkach wywoływać funkcje.
//Sprobuj dodac tez on_fail i on_succ funkcje

Item {
    height: column.implicitHeight

    property int fixedHeight: 0

    function enableBusyIndicator() {
        busyIndicator.running = true
    }

    function disableBusyIndicator() {
        busyIndicator.running = false
    }

    function validate() {
        let status = true;
        if(loginInput.isEmpty()) {
            PopupManager.showError("Enter current login!", 3000)
            loginInput.showError()
            status = false
        }
        if(currentPasswordInput.isEmpty()) {
            PopupManager.showError("Enter current password!", 3000)
            currentPasswordInput.showError()
            status = false
        }
        if(newPasswordInput.isEmpty()) {
            PopupManager.showError("Enter a new password!", 3000)
            newPasswordInput.showError()
            status = false
        }
        if(retypeNewPasswordInput.isEmpty()) {
            PopupManager.showError("Retype new password!", 3000)
            retypeNewPasswordInput.showError()
            status = false
        }
        else if(newPasswordInput.getValue() != retypeNewPasswordInput.getValue()) {
            PopupManager.showError("New password did not match!", 3000)
            newPasswordInput.showError()
            retypeNewPasswordInput.showError()
            status = false
        }
        else if(newPasswordInput.getValue() == currentPasswordInput.getValue()) {
            PopupManager.showError("New password should not be the same as current!", 3000)
            newPasswordInput.showError()
            retypeNewPasswordInput.showError()
            currentPasswordInput.showError()
            status = false
        }
        return status
    }

    Column {
        id: column
        anchors.fill: parent
        spacing: Constants.BigMargin

        Item {
            height: fixedHeight
            width: parent.width
            Text {
                id: loginLbl
                height: fixedHeight
                anchors.left: parent.left
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "Login:"
                color: Colors.TextColor
                font.pointSize: 16
                font.bold: true
            }

            BusyIndicator {
                id: busyIndicator
                running: false
                height: fixedHeight
                anchors.right: parent.right
            }
        }

        TextInput_C {
            id: loginInput
            height: fixedHeight
            width: parent.width * 0.8
            fontSize: 16
        }

        Text {
            id: currentPasswordLbl
            height: fixedHeight
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: "Current password:"
            color: Colors.TextColor
            font.pointSize: 16
            font.bold: true
        }

        TextInput_C {
            id: currentPasswordInput
            height: fixedHeight
            width: parent.width * 0.8
            fontSize: 16
            mode: TextInput.Password
        }


        Text {
            id: newPasswordLbl
            height: fixedHeight
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: "New password:"
            color: Colors.TextColor
            font.pointSize: 16
            font.bold: true
        }

        TextInput_C {
            id: newPasswordInput
            height: fixedHeight
            width: parent.width * 0.8
            fontSize: 16
            mode: TextInput.Password
        }

        Text {
            id: retypeNewPasswordLbl
            height: fixedHeight
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: "Retype new password:"
            color: Colors.TextColor
            font.pointSize: 16
            font.bold: true
        }

        TextInput_C {
            id: retypeNewPasswordInput
            height: fixedHeight
            width: parent.width * 0.8
            fontSize: 16
            mode: TextInput.Password
        }

        Button_C {
            width: parent.width * 0.8
            height: fixedHeight

            baseText: "Save"
            fontSize: 24

            baseColor: Colors.MainBGDarker
            textColor: Colors.TextColor
            hoverColor: Colors.MainBG
            borderColor: Colors.SubtleAccent
            borderWidth: 2
            vAlignment: Text.AlignBottom

            onPressedButton: {
                if(validate()) {
                    Coffey.changePassword(loginInput.getValue(), currentPasswordInput.getValue(), newPasswordInput.getValue())
                    enableBusyIndicator()
                }
            }
        }
    }
}
