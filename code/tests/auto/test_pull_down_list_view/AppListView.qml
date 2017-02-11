import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

import "../../../timer"

ListView {
    id: listView

    signal pullDowning()

    readonly property alias pullDown: pullDown

    header: Item {
        width: listView.width
        height: 0
        clip: true
        property alias busyer: busyer

        Behavior on height {
            NumberAnimation {
                duration: 300
            }
        }

        BusyIndicator {
            id: busyer
            anchors.centerIn: parent
            running: false
        }
    }

    PullDown {
        id: pullDown
        flickable: listView
        offestY: 50
        onRelease: {
            listView.__whenPullDown();
        }
    }

    Lazyer {
        id: lazyer
    }

    function __whenPullDown() {
        listView.headerItem.height = pullDown.offestY;
        listView.headerItem.busyer.running = true;
        pullDowning();
    }

    function release() {
        listView.headerItem.busyer.running = false;
        lazyer.lazyDo(300, function(){
            listView.headerItem.height = 0;
        });

    }
}
