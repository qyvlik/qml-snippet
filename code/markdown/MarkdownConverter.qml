import QtQuick 2.0

import "showdown.js" as ShowDown

QtObject {
    readonly property var converter: new ShowDown.showdown.Converter()

    property real imageWidth: 360

    function makeHtml(html) {
        return converter.makeHtml(html);
    }
}
