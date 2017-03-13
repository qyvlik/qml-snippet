import QtQuick 2.0

Item {
    property Abstract i : Abstract {
        id: instance
        //@override
        function __functorImpl() {
            console.log("__functorImpl override")
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            instance.functor()
            i.functor();
            instance.impl();
        }
    }
}
