import QtQuick 2.0
import QtQuick.Window 2.2
import Qt.labs.folderlistmodel 2.1

Item {

    readonly property alias windowComponent: windowCom
    readonly property alias folderListModel: folderListModel

    property real windowWidth: 360
    property real windowHeight: 640

    function openTestWindow(testName, filePath) {
        var w = windowCom.createObject(null,
                                       {x:0,y:0, width: windowWidth, height: windowHeight});
        var com = Qt.createComponent(filePath, Component.PreferSynchronous);
        if (com.status === Component.Ready) {
            var test = com.createObject(w);
            w.title = testName;
            w.show();
        } else {
            w.destroy();
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

}
