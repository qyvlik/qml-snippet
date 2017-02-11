import QtQuick 2.0
//! [Sparrow/Utility/Ticker](https://github.com/qyvlik/Sparrow.2/blob/master/old_code/src/Sparrow/Utility/Ticker.qml)
/*!
    \qmltype Ticker
    Example:
    \qml
    Ticker {
        id: ticker
        Component.onCompleted: {
            lazyer.tick(1000, function(){
                console.log("tick....");
            });
        }
    }
    \endqml
*/
Timer {
    id: ticker
    interval: 100
    repeat: true
    triggeredOnStart: true
    property var callable
    onTriggered: {
        try {
            callable();
        } catch(e) {
            console.trace();
            console.log(e);
        }
    }

    function tick(time, callable) {
        interval = time;
        ticker.callable = callable;
        ticker.start();
    }
}
