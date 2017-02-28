import QtQuick 2.0

import "./crypto-js/crypto-js.js" as CryptoJS

Item {
    Component.onCompleted: {

        for(var iter in CryptoJS["CryptoJS"]) {
            console.log(iter, CryptoJS["CryptoJS"][iter])
        }

        var encrypted = CryptoJS.CryptoJS.MD5("");
        console.log(encrypted);
    }
}
