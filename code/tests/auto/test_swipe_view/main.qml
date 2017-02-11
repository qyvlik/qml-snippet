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

    Item {
        anchors.fill: parent
        ColumnLayout {
            anchors.fill: parent

            spacing: 0

            TabBar {
                id: bar
                currentIndex: swipeView.currentIndex
                Layout.fillWidth: true
                TabButton {
                    text: qsTr("1")
                    onClicked: {
                        swipeView.currentIndex = 0
                    }
                }
                TabButton {
                    text: qsTr("2")
                    onClicked: {
                        swipeView.currentIndex = 1
                    }
                }
                TabButton {
                    text: qsTr("3")
                    onClicked: {
                        swipeView.currentIndex = 2
                    }
                }
            }

            SwipeView {
                id: swipeView
                Layout.fillWidth: true
                Layout.fillHeight: true

                Rectangle {
                    width: 360
                    height: 340
                    color: randomColor()
                }
                Rectangle {
                    width: 360
                    height: 340
                    color: randomColor()
                }
                Rectangle {
                    width: 360
                    height: 340
                    color: randomColor()
                }
            }
        }
    }

}
