import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Item {
    width: 360
    height: 640

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Item {
            width: parent.width
            height: parent.height

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                TextEdit {
                    id: textEdit
                    wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                RowLayout {
                    Layout.fillWidth: true
                    Button {
                        text: "view"
                        onClicked: {
                            stackView.push({item:viewr,
                                               properties:{text:converter.makeHtml(textEdit.text)}})
                        }
                    }
                }
            }
        }
    }

    MarkdownConverter {
        id: converter
    }

    Component {
        id: viewr
        Item {
            width: stackView.width
            height: stackView.height
            property alias text: showText.text

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                TextEdit {
                    id: showText
                     textFormat: Text.RichText
                     wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                     selectByMouse: true
                    width: parent.width
                    Layout.fillHeight: true
                    readOnly: true
                }



                RowLayout {
                    Layout.fillWidth: true
                    Button {
                        text: "back"
                        onClicked: {
                            stackView.pop()
                        }
                    }
                }
            }
        }
    }
}


