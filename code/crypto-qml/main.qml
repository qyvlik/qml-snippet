import QtQuick 2.0

import "./crypto-js/crypto-js.js" as CryptoJS

Item {

    width: 360
    height: 640

    function listAll() {
        for(var iter in CryptoJS["CryptoJS"]) {
            console.log(iter, CryptoJS["CryptoJS"][iter])
        }
    }

    function testMd5() {
        var encrypted = CryptoJS.CryptoJS.MD5("");
        console.log("md5:", encrypted);
    }

    function testSHA256() {
        var encrypted = CryptoJS.CryptoJS.SHA256("");
        console.log("SHA256:", encrypted);
    }

    function encrypt(word){
        var key = CryptoJS.CryptoJS.enc.Utf8.parse("0102030405060708");   //加密密钥
        var iv  = CryptoJS.CryptoJS.enc.Utf8.parse('0102030405060708');   //加密向量
        var srcs = CryptoJS.CryptoJS.enc.Utf8.parse(word);
        var encrypted = CryptoJS.CryptoJS.AES.encrypt(srcs, key, {
                                                          iv: iv,
                                                          mode: CryptoJS.CryptoJS.mode.CBC
                                                      });
        return encrypted.toString();
    }


    MouseArea {
        anchors.fill: parent
        onClicked: {
//            listAll();
            testMd5();
            testSHA256();

            console.log(CryptoJS.CryptoJS.mode.ECB)

            console.log(encrypt("ddd"))
        }
    }
}
