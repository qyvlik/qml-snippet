import QtQuick 2.0

// Abstract
QtObject {
    id: abstractObject

    readonly property var impl: abstractObject.__functorImpl

    function functor() {
        __functorImpl()
    }

    function __functorImpl() {
        console.log("__functorImpl in abstract")
    }
}
