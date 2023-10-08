import QtQuick

Item {
    width: 45
    height: 45

        Image {
            id: userImg
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: "qrc:/icons/icons/shrek.png"
        }
}
