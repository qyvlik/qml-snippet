import QtQuick 2.0

QtObject {

    property Flickable flickable

    property real offestY

    readonly
    property bool pulldown: flickable == null ? false
                                              :(-flickable.contentY)-offestY > 0;

    readonly
    property bool __release: flickable == null ? false
                                               : flickable.dragging == false && pulldown;

    signal release()

    on__ReleaseChanged: {
        if(__release) {
            release();
        }
    }
}
