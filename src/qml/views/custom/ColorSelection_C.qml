import QtQuick
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Item {
    id: root
    property int partHeight: 0
    property color selectedColor: Qt.rgba(0.2, 0.1, 0.9, 1)
    property bool isEditMode: false

    height: partHeight * 1.2 + ((isEditMode) ? (partHeight + Constants.SmallMargin) * 3 : 0)

    signal selected(selected_color: color)

    onSelectedColorChanged: {
        saveBtn.setBaseColor(root.selectedColor)
    }

    function normalize(value: int) {
        return (value - 0)/(255-0)
    }

    Column {
        anchors.fill: parent
        spacing: Constants.SmallMargin

        Slider_C {
            width: parent.width
            height: partHeight
            defaultValue: selectedColor.r * 255
            baseColor: Colors.Red
            visible: isEditMode
            onValueChanged:
                function (value) {
                    selectedColor.r = normalize(value)
                }
        }

        Slider_C {
            width: parent.width
            height: partHeight
            defaultValue: selectedColor.g * 255
            baseColor: Colors.Green
            visible: isEditMode
            onValueChanged:
                function (value) {
                    selectedColor.g = normalize(value)
                }
        }

        Slider_C {
            width: parent.width
            height: partHeight
            defaultValue: selectedColor.b * 255
            baseColor: Colors.Blue
            visible: isEditMode
            onValueChanged:
                function (value) {
                    selectedColor.b = normalize(value)
                }
        }

        Button_C {
            id: saveBtn
            width: parent.width
            height: partHeight * 1.2
            vAlignment: Text.AlignTop
            baseText: (isEditMode) ? "Save" : "Change"
            textColor: {
                let max = 0
                if(selectedColor.r >= selectedColor.g)
                    max = selectedColor.r
                else
                    max = selectedColor.g
                if(selectedColor.b >= max)
                    max = selectedColor.b
                let textColor = Qt.rgba(0,0,0,1)
                textColor.r = 1 - max
                textColor.g = 1 - max
                textColor.b = 1 - max
                return textColor
            }
            onPressedButton: {
                if(isEditMode)
                    root.selected(root.selectedColor)
                isEditMode = !isEditMode
            }
        }
    }
}
