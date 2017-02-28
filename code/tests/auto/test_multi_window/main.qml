import QtQuick 2.0

Item {
    id: root
    width: 360
    height: 640
    Rectangle {
        anchors.fill: parent
        color: "green"
        MouseArea {
            anchors.fill: parent
            onClicked: Qt.quit()
        }
    }

}
