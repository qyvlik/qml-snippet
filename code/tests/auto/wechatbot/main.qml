import QtQuick 2.0

import "../../../commont"
import "../../../commont/commont.js" as Commont

Item {

    id: root
    width: 360
    height: 640

    Image {
        id: qrcodeImg
        width: 360
        height: 360
                source: "https://login.weixin.qq.com/qrcode/"+uuid
    }

    property string uuid

    Timer {
        id: loop
        repeat: true
        running: true
        interval: 1000
        onTriggered: {
            if(Commont.stringNotEmpty(root.uuid)) {
                loginApi.wait4QRCodeScaned(root.uuid, function(code, redirect_uri) {
                    console.log("code", code,
                                "redirect_uri", redirect_uri);
                    if(code === 408) {
                        uuid = "";
                    } else if(code === 200) {
                        uuid = "";
                        // Commont.ajax("GET", redirect_uri);
                    }
                })
            }
        }
    }

    LoginApiVisitor {
        id: loginApi
    }


    MouseArea {
        anchors.fill: parent
        onClicked: {
            loginApi.getUUID( function(code, error, uuid) {
                console.log("code", code,
                            "error", error,
                            "uuid", uuid);

                if(Commont.stringNotEmpty(uuid)) {
                    root.uuid = uuid;
                }
            });
        }
    }


    function getTagContent(xmlContent, openTag, closeTag) {
        var start = xmlContent.indexOf(openTag);
        var end = xmlContent.indexOf(closeTag);
        var tagContent = xmlContent.substring(start + openTag.length, end);
        return tagContent;
    }

    Component.onCompleted: {


    }
}
