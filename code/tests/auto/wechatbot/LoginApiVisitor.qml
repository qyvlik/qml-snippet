import QtQuick 2.0

import "../../../commont"
import "../../../commont/commont.js" as Commont

QtObject {
    id: apiVisitor

    property string apiHost: "https://login.weixin.qq.com"


    function getUUID(callback) {
        callback = callback || function(code, error, uuid) {
            console.log("code", code,
                        "error", error,
                        "uuid", uuid);
        }

        var data = {
            "appid": "wx782c26e4c19acffb",
            "fun": "new",
            "lang": "zh_CN",
            "_": Date.now()
        }

        var headers = {
            "Content-Type":"application/x-www-form-urlencoded;charset=utf-8",
        }

        var queryParams = Commont.urlQuery(data);
        var path = "/jslogin";

        var url = apiHost + path + "?" + queryParams;

        console.log("url", url);

        Commont.ajax("GET", url, headers, "", function(xhr){
            var responseText = xhr.responseText;

            var code = "window.QRLogin = {}; %1; return window.QRLogin;".arg(responseText);
            console.log("code", code);

            var callbackFromWechat = new Function("window", code);
            var window = {};
            var result = callbackFromWechat(window);
            callback(result.code, result.error, result.uuid);
        });
    }

    function wait4QRCodeScaned(uuid, callback) {
        callback = callback || function(code, redirect_uri) {
            console.log("code", code,
                        "redirect_uri", redirect_uri);
        }

        var headers = {
            "Content-Type":"application/x-www-form-urlencoded;charset=utf-8",
        }

        var path = "/cgi-bin/mmwebwx-bin/login" + "?uuid="+uuid;
        var url = apiHost + path;
        console.log("url", url);

        Commont.ajax("GET", url, headers, "", function(xhr){
            var responseText = xhr.responseText;

            var code = " %1; return window;".arg(responseText);
            console.log("code", code);

            var callbackFromWechat = new Function("window", code);
            var window = {};
            var result = callbackFromWechat(window);
            callback(result.code, result.redirect_uri);
        });
    }




}
