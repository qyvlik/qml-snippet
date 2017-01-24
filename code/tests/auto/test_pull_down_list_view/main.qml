import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0

import "../../../task"

Item {
    id: root
    width: 360
    height: 640

    Task {
        id: task
        run: function() {
            console.log("task...")
        }
    }

    TaskExcutor {
        taskList: [task]
    }


    ListView {
        id: listView

        PullDown {
            id: pullDown
            flickable: listView
            offestY: 50
            onRelease: {
                console.log("release")
            }
        }

        anchors.fill: parent
        anchors.margins: 10
        model: 10
        clip: true
        delegate: Item {
            width: parent.width
            height: width * 0.6
            Rectangle {
                anchors.fill: parent
                border.color: "gray"
                border.width: 1
            }
        }
    }

}
