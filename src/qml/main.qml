import QtQuick
import "views/"
import "views/elements/"
import "views/elements/popup"
import "qrc:/config/Colors.js" as Colors
import "qrc:/config/Constants.js" as Constants

Window {
    id: window
    title: qsTr("Coffey")
    visibility: Qt.WindowFullScreen
    visible: true

    Connections {
        target: Coffey
        function onLogged() {
            loader.setSource("qrc:/views/AppView.qml")
            console.log("Succesfully logged");
        }
    }

    Loader {
        id: loader
        anchors.fill: parent
        source: "qrc:/views/AppView.qml"
    }
}
