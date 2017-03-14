import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

import "./crypto-js/crypto-js.js" as CryptoJSLib
import "../commont/commont.js" as Commont

Item {

    width: 240
    height: 320

    function testMd5() {
        var encrypted = CryptoJSLib.CryptoJS.MD5("");
        console.log("md5:", encrypted);
    }

    function testSHA256() {
        var encrypted = CryptoJSLib.CryptoJS.SHA256("");
        console.log("SHA256:", encrypted);
    }

    readonly property string iv: "16BytesLengthKey"

    ///! [WelkinXie/AESCipher-Java](https://github.com/WelkinXie/AESCipher-Java)
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


    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10

        Button {
            text: "test aes"
            Layout.fillWidth: true
            onClicked: {
                testAES1();
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }

    function testAES1() {
        var message = "IAmThePlainText";
        var ciphertext = encryptAES(message, "16BytesLengthKey");
        console.log("ciphertext ", ciphertext );
        var text = decryptAES(ciphertext, "16BytesLengthKey");
        console.log("text ", text );
    }
}
