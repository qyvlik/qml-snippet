import QtQuick 2.0

import "../commont/commont.js" as Commont


Item {

    Text {
        anchors.centerIn: parent
        text: taskExcutor.executeTask + ":" + taskExcutor.taskList.length
    }

    TaskExcutor {
        id: taskExcutor
        repeat: true
        interval: 500
        triggeredOnStart: true
        queueModel: false

        taskList: [
            task1,
            task2
        ]
    }

    Task {
        id: task1
//        async: true
        run: function() {
            console.log("start...");
            Commont.ajax("GET", "https://api.github.com/zen", {}, "", function(xhr){
                console.log("task1 : " + xhr.responseText);
                task1.finished({});
            });
        }
    }

    Task {
        id: task2
//        async: true
        run: function() {
            console.log("start...");
            Commont.ajax("GET", "https://api.github.com/zen", {}, "", function(xhr){
                console.log("task2: " + xhr.responseText);
                task2.finished({});
            });
        }
    }

    Component.onCompleted: {
        taskExcutor.start();


        console.log(Commont.randomString(16, false))
    }
}
