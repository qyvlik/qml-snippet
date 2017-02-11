import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0

import "../../../task"

import "../../../commont/commont.js" as Commont

Item {
    id: root
    width: 360
    height: 640

    AppListView {
        id: listView
        anchors.fill: parent

        anchors.margins: 10
        clip: true

        delegate: Item {
            width: parent.width
            height: width * 0.2
            Rectangle {
                anchors.fill: parent
                border.color: "gray"
                border.width: 1

                Text {
                    anchors.centerIn: parent
                    text: zen
                }
            }
        }

        model: listModel

        ListModel {
            id: listModel
        }

        onPullDowning: {
            Commont.ajax("GET", "https://api.github.com/zen", {}, {}, function(xhr){
                listModel.insert(0, {"zen": xhr.responseText});
                listView.release();
            });
        }
    }

}
