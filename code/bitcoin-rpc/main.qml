import QtQuick 2.0

Item {

    width: 240
    height: 320

    focus: true

    BitcoinRPC {
        id: rpc
        url: "http://192.168.1.137:8332"
        user: "bitcoin"
        password: "123"
    }

    Text {
        anchors.centerIn: parent
        text: "rpc"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: test()
    }

    function test() {
           rpc.getrawmempool();
    }

    Keys.onEscapePressed: {
        Qt.quit()
    }

    Keys.onSpacePressed: {
        test();
    }
}
