import QtQuick 2.0
import QtQuick.Window 2.2
import Qt.labs.folderlistmodel 2.1

Item {

    readonly property alias windowComponent: windowCom
    readonly property alias folderListModel: folderListModel

    property real windowWidth: 360
    property real windowHeight: 640

    function openTestWindow(testName, filePath) {

        var com = Qt.createComponent(filePath, Component.PreferSynchronous);
        if (com.status === Component.Ready) {
            var testItem = com.createObject();
            if(!instanceOf.isWindow(testItem)) {
                var w = windowCom.createObject(null,
                                               {x:0,y:0, width: windowWidth, height: windowHeight});
                testItem.parent = w.contentItem;
                w.title = testName;
                w.show();
            } else {
                testItem.title = testName;
                testItem.show();
            }

        } else {
            console.log(com.errorString(), com.status);
        }
    }

    Component {
        id: windowCom

        Window {
            onClosing: destroy()
        }
    }

    FolderListModel {
        id: folderListModel
        showFiles: false
    }

    QtObject {
        id: instanceOf
        property Window __window: null

        function isWindow(w) {
            try {
                __window = w;
                return true;
            } catch(e) {
                return false;
            } finally {
                __window = null;
            }
        }
    }

}
