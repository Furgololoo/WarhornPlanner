import QtQuick
import QtQuick.Effects
import "../../config/Colors.js" as Colors
import "../../config/Constants.js" as Constants

Item {
    id: root

    property bool is_visible: false

    function setPosition(obj: Ticket) {
        is_visible = true
        root.x = obj.x + Constants.SmallMargin
        root.y = obj.y + Constants.SmallMargin
        box.color = obj.getPriorityColor()
    }

    Rectangle {
        id: box
        anchors.fill: parent
        color: Colors.Red
        visible: is_visible
    }
    MultiEffect {
        id: effect
        visible: is_visible
        source: box
        anchors.fill: box
        brightness: 0.4
        saturation: 0.2
        blurEnabled: true
        blurMax: 64
        blur: 1.0
    }
}
