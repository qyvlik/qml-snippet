import QtQuick 2.0

/*
  when task finished call finished
*/

QtObject {
    id: task

    property bool autoDelete: false
    property bool async: false

    signal message(var messageObject)
    signal finished(var messageObject)
    signal error(var messageObject)

    property var run

    function start() {
        try {
            if(typeof run === 'function') {
                run();
            }
        } catch(e) {
            console.error(e);
            error(e);
        } finally {
            if(autoDelete) {
                task.deleteLater();
            }
        }
    }

}
