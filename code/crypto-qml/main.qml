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

    readonly property string iv: "16-Bytes--String"

    ///! [WelkinXie/AESCipher-Java](https://github.com/WelkinXie/AESCipher-Java)
    // 加密
    function encryptAES(content, key) {
        var CryptoJS = CryptoJSLib.CryptoJS;
        var AES = CryptoJS.AES;
        var ivStr  = CryptoJS.enc.Utf8.parse(iv);
        var keyStr = CryptoJS.enc.Utf8.parse(key);

        var text = AES.encrypt(content, keyStr, {
                                        iv: ivStr,
                                        mode: CryptoJS.mode.CBC,
                                        padding: CryptoJS.pad.Pkcs7
                                    });
        return text.toString();
    }

    // 解密
    function decryptAES(ciphertext, key) {
        var CryptoJS = CryptoJSLib.CryptoJS;
        var AES = CryptoJS.AES;
        var ivStr  = CryptoJS.enc.Utf8.parse(iv);
        var keyStr = CryptoJS.enc.Utf8.parse(key);

        var bytes = AES.decrypt(ciphertext, keyStr, {
                                        iv: ivStr,
                                        mode: CryptoJS.mode.CBC,
                                        padding: CryptoJS.pad.Pkcs7
                                    });
        var plaintext = bytes.toString(CryptoJS.enc.Utf8);
        return plaintext.toString();
    }


    MouseArea {
        anchors.fill: parent
        onClicked: {
            var ciphertext = encryptAES("IAmThePlainText", "16BytesLengthKey");
            console.log("ciphertext ", ciphertext );
            var text = decryptAES(ciphertext, "16BytesLengthKey");
            console.log("text ", text )
        }
    }
}
