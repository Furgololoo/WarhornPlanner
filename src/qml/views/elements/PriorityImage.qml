import QtQuick
import "../../config/Colors.js" as Colors
import "../../config/Constants.js" as Constants

Item {
    property color dotsColor: Colors.Green
    function setDotsCount(count: int) {
        repeater.model = 6 - count
        switch(6 - count) {
        case 5: dotsColor = Colors.Red; break;
            case 4: dotsColor = Colors.Orange; break;
                case 3: dotsColor = Colors.Yellow; break;
                    case 2: dotsColor = Colors.Green; break;
                        case 1: dotsColor = Colors.Blue; break;
        }
    }

    Row {
        anchors.fill: parent
        spacing: Constants.SmallMargin

        Repeater {
            id: repeater
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height * 0.6
                width: parent.height * 0.6
                radius: parent.height
                color: dotsColor
            }
        }
    }
}
