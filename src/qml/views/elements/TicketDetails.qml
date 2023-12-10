import QtQuick
import "../custom/"
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    height: fixedHeight * 11
    property int fixedHeight: parent.height / 8

    Row {
        id: row
        width: parent.width
        height: root.fixedHeight * 5
        spacing: parent.width * 0.05

        Column {
            id: firstLabelColumn
            height: parent.height
            width: parent.width * 0.05

            Text {
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "Type:"
                color: Colors.TextColor
                font.pointSize: 14
            }

            Text {
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "Component:"
                color: Colors.TextColor
                font.pointSize: 14
            }

            Text {
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "Project name:"
                color: Colors.TextColor
                font.pointSize: 14
            }

            Text {
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "Create date:"
                color: Colors.TextColor
                font.pointSize: 14
            }

            Text {
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "Update date:"
                color: Colors.TextColor
                font.pointSize: 14
            }
        }

        Column {
            id: firstValueColumn
            height: parent.height
            width: parent.width * 0.45

            Text {
                id: typeText
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "typeText"
                color: Colors.TextColor
                font.pointSize: 14
                font.bold: true
            }

            Text {
                id: componentText
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "componentText"
                color: Colors.TextColor
                font.pointSize: 14
                font.bold: true
            }

            Text {
                id: projectNameText
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "projectNameText"
                color: Colors.TextColor
                font.pointSize: 14
                font.bold: true
            }

            Text {
                id: createDateText
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "createDateText"
                color: Colors.TextColor
                font.pointSize: 14
                font.bold: true
            }

            Text {
                id: updateDateText
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "updateDateText"
                color: Colors.TextColor
                font.pointSize: 14
                font.bold: true
            }
        }

        Column {
            id: secondLabelColumn
            height: parent.height
            width: parent.width * 0.05

            Text {
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "Status:"
                color: Colors.TextColor
                font.pointSize: 14
            }

            Text {
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "Priority:"
                color: Colors.TextColor
                font.pointSize: 14
            }

            Text {
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "Sprint ID:"
                color: Colors.TextColor
                font.pointSize: 14
            }
        }

        Column {
            id: secondValueColumn
            height: parent.height
            width: parent.width * 0.45

            Text {
                id: statusText
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "statusText"
                color: Colors.TextColor
                font.pointSize: 14
                font.bold: true
            }

            Text {
                id: priorityText
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "priorityText"
                color: Colors.TextColor
                font.pointSize: 14
                font.bold: true
            }

            Text {
                id: sprintIDText
                height: root.fixedHeight
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: "sprintIDText"
                color: Colors.TextColor
                font.pointSize: 14
                font.bold: true
            }

        }
    }

    Item {
        id: acceptanceCriteriaItem
        anchors.top: row.bottom
        width: parent.width * 0.6
        height: root.fixedHeight * 2

        Text {
            id: acceptanceCriteriaText
            height: parent.height * 0.2
            anchors.top: parent.top
            text: "Acceptance Criteria"
            color: Colors.TextColor
            font.pixelSize: height
        }
        TextArea_C {
            id: acceptanceCriteriaInput
            anchors.top: acceptanceCriteriaText.bottom
            anchors.topMargin: Constants.SmallMargin
            anchors.bottom: parent.bottom
            width: parent.width
            isEditable: false
            baseText: "Asddasdasdas"
        }
    }

    Item {
        id: descriptionItem
        anchors.top: acceptanceCriteriaItem.bottom
        anchors.topMargin: Constants.BigMargin
        anchors.bottom: root.bottom
        width: parent.width * 0.6

        Text {
            id: descriptionText
            height: acceptanceCriteriaText.height
            anchors.top: parent.top
            text: "Description"
            color: Colors.TextColor
            font.pixelSize: height
        }
        TextArea_C {
            id: descriptionInput
            anchors.top: descriptionText.bottom
            anchors.topMargin: Constants.SmallMargin
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: parent.width
            isEditable: false
            baseText: "Asddasdasdas"
        }
    }
}
