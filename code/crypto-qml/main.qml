import QtQuick 2.0

import "./crypto-js/crypto-js.js" as CryptoJSLib

Item {

    width: 360
    height: 640

    function listAll() {
        for(var iter in CryptoJSLib["CryptoJS"]) {
            console.log(iter, CryptoJSLib["CryptoJS"][iter])
        }
    }

    function testMd5() {
        var encrypted = CryptoJSLib.CryptoJS.MD5("");
        console.log("md5:", encrypted);
    }

    function testSHA256() {
        var encrypted = CryptoJSLib.CryptoJS.SHA256("");
        console.log("SHA256:", encrypted);
    }

    function encrypt(word){
        var key = CryptoJSLib.CryptoJS.enc.Utf8.parse("0102030405060708");   //加密密钥
        var iv  = CryptoJSLib.CryptoJS.enc.Utf8.parse('0102030405060708');   //加密向量
        var srcs = CryptoJSLib.CryptoJS.enc.Utf8.parse(word);
        var encrypted = CryptoJSLib.CryptoJS.AES.encrypt(srcs, key, {
                                                          iv: iv,
                                                          mode: CryptoJSLib.CryptoJS.mode.CBC
                                                      });
        return encrypted.toString();
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
//            listAll();
            testMd5();
            testSHA256();
            console.log(encrypt("ddd"))
        }
    }
}
