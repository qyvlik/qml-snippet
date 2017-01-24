import QtQuick 2.0

import "../commont/commont.js" as Comment

Timer {
    id: taskExector

    property bool executeTask: false
    property bool queueModel: true
    property int currentTaskIndex: 0
    property var taskList:[]


    function add(task) {
        taskList.push(task);
    }

    function take() {
        var task;
        if(queueModel) {
            if(taskList.length != 0) {
                currentTaskIndex = 0;
                task = taskList.shift();
            }
        } else {
            if(taskList.length == currentTaskIndex ) {
                currentTaskIndex = 0;
            }
            task = taskList[currentTaskIndex];
            currentTaskIndex++;
        }

        return task;
    }

    onTriggered: {
        if(!executeTask) {
            runTask(take());
        }
    }

    function runTask(task) {
        if(typeof task !== 'object') {
            return;
        }

        try {
            executeTask = true;

            if(!task.async) {

                Comment.connectOnce(task, "finished", function(){
                    executeTask = false;
                });

                Comment.connectOnce(task, "error", function(){
                    executeTask = false;
                });
            }

            task.start();

            if(task.async) {
                executeTask = false;
            }

        } catch(e) {
            console.error(e);
            executeTask = false;
        }

    }
}
