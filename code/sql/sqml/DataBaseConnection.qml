import QtQuick 2.0
import QtQuick.LocalStorage 2.0

QtObject {

    property string identifier: ""
    property string version: ""
    property string description: ""
    property int estimated_size: 0

    readonly property var database: __database

    property var __database
    property bool isOpen: false


    function __tryOpen() {
        if(!isOpen) {
            __openDatabase();
        }
    }

    function __openDatabase() {
        if(isOpen) {
            return;
        }

        if(identifier !== '' && version !== '' && description !== '' && estimated_size != 0) {
            __database = LocalStorage.openDatabaseSync(identifier,
                                                       version,
                                                       description,
                                                       estimated_size);
            isOpen = true;
        } else {
            throw "arguments lost!";
        }
    }

    function changeVersion(from, to, callback) {
        __tryOpen();

        if(typeof from === 'undefined' || from === '') {
            return;
        }

        if(typeof to === 'undefined' || to === '') {
            return;
        }

        if(from === to) {
            return;
        }

        database.changeVersion(from, to, callback);
        version = to;
    }

    function transaction(callback) {
        __tryOpen();

        database.transaction(callback);
    }

    function readTransaction(callback) {
        __tryOpen();

        database.readTransaction(callback);
    }
}
