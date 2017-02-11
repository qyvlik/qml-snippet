//~ Lazyer

import QtQuick 2.0
//! [Sparrow/Utility/Ticker](https://github.com/qyvlik/Sparrow.2/blob/master/old_code/src/Sparrow/Utility/Lazyer.qml)
/*!
    \qmltype Lazyer
    Example:
    \qml
    Lazyer {
        id: lazyer
        Component.onCompleted: {
            lazyer.lazyDo(1000, function(){
                console.log("1000ms")
                lazyer.lazyDo(1000, function(){
                    console.log("1000ms")
                });
            });
        }
    }
    \endqml
*/

QtObject {
    id: lazyer

     property var __: Component {
        id: timerComponent
        Timer {
            property var callable
            onTriggered: {
                // Only Do Once
                destroy();
                callable();
            }
            function lazyDo(time, callback) {
                interval = time;
                callable = callback;
                start();
            }
        }
    }

    function lazyDo(time, callback) {
        timerComponent.createObject(lazyer).lazyDo(time, callback);
    }
}
