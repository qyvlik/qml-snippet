import QtQuick 2.0

Item {
    id: root
    width: 400
    height: 400

    MouseArea {
        anchors.fill: parent
        onClicked: {
            myWorker.sendMessage({data:"good"})
        }
    }

    WorkerScript {
        id: myWorker
        source: "./worker.js"

        onMessage: {
            console.log(JSON.stringify(messageObject))
        }

    }
}
