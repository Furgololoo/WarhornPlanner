import QtQuick

Item {
    width: 55
    height: 55

        Image {
            id: userImg
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: "qrc:/icons/icons/shrek.png"
        }
}
