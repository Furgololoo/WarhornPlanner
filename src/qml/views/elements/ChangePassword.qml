import QtQuick
import "../custom/"
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    height: column.implicitHeight

    property int fixedHeight: 0

    Column {
        id: column
        anchors.fill: parent
        spacing: Constants.BigMargin

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
        }
    }
}
