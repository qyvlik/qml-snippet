import QtQuick 2.5
import QtQuick.Window 2.2

import "showdown.js" as ShowDown

Window {
    visible: true

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }

    //.pragma library

//    var showdownJar = {};

    Component.onCompleted: {
        var converter =
        new ShowDown.showdown
        .Converter(),
            text      = '#hello, markdown!',
            html      =
                converter
        .makeHtml(text);

        console.log(html)

    }
}


