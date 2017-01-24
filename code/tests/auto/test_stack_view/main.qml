import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0

Item {
    id: root
    function randomColor(a) {
        a = a || 1;
        return Qt.rgba(Math.random(), Math.random(), Math.random(), a);
    }

    width: 360
    height: 640

    Component {
        id: com
        Rectangle {
            width: root.width
            height: root.height
            color: randomColor(1);
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 20
                Button {
                    Layout.fillWidth: true
                    text: "push"
                    onClicked: {
                        stackView.push(com)
                    }
                }

                Button {
                    Layout.fillWidth: true
                    text: "pop"
                    onClicked: {
                        stackView.pop()
                    }
                }

                Button {
                    Layout.fillWidth: true
                    text: "pop home"
                    onClicked: {
                        stackView.pop(stackView.get(0))
                    }
                }
                Item {
                    Layout.fillHeight: true
                }
            }
        }
    }


    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Rectangle {
            width: stackView.width
            height: stackView.height
            color: "black"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    stackView.push(com)
                }
            }

            Text {
                color: "white"
                text: "Home"
                anchors.centerIn: parent

            }
        }
    }
}
