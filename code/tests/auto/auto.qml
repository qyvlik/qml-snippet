import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.2

import Qt.labs.folderlistmodel 2.1

import "../../auto_test"
import "../../commont/commont.js" as Common

Item {

    id: root
    width: 360
    height: 640

    Auto {
        id: auto
        folderListModel.showFiles: false
        folderListModel.folder: Qt.resolvedUrl("./auto.qml").replace("auto.qml", "")
    }

    ListView {
        anchors.fill: parent
        anchors.margins: 10
        model: auto.folderListModel
        clip: true
        delegate: Item {
            width: parent.width
            height: width * 0.2

            Rectangle {
                anchors.fill: parent
                border.color: "gray"
                border.width: 1
                Text {
                    id: testName
                    anchors.centerIn: parent
                    text: filePath.split("/").pop() + "/main.qml"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var path = filePath.split("/").pop();
                        var fileName = path + "/main.qml";
                        auto.openTestWindow(fileName, Qt.resolvedUrl(fileName));
                    }
                }
            }
        }
    }

    Text {
        anchors.centerIn: parent
        text: auto.folderListModel.folder
    }

    Component.onCompleted: {
        console.log(Qt.resolvedUrl("#").replace("#", ""));
    }
}
