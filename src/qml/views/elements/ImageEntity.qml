import QtQuick
import "../custom/"
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    height: 50
    width: parent.width

    property var imageList: ({})
    property int index: 0

    function setAttachmentName(text: string) {
        attachmentName.baseText = text
    }

    function setImageList(obj: ImageList) {
        root.imageList = obj
    }

    function lostFocus() {
        titleInput.lostFocus()
    }

    Button_C {
        id: attachmentName
        anchors.left: parent.left
        height: parent.height
        width: parent.width * 0.75
        baseColor: Colors.MainBGDarker
        textColor: Colors.TextColor
        hoverColor: Colors.MainBG
        borderColor: Colors.MainBG
        borderWidth: 2
        hAlignment: Text.AlignLeft
        baseText: "undefined"
    }

    Image {
        anchors.left: attachmentName.right
        anchors.leftMargin: (parent.width - attachmentName.width) / 2
        anchors.verticalCenter: parent.verticalCenter
        width: sourceSize.width + 10
        height: sourceSize.height + 10
        source: "qrc:/icons/icons/colors/close.png"

        MouseArea {
            anchors.fill: parent
            onPressed: {
                root.imageList.removeMe(root.index)
            }
        }
    }
}
