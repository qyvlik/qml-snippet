import QtQuick 2.0


//! [Bitcoin RPC error codes](https://github.com/bitcoin/bitcoin/blob/62f2d769e45043c1f262ed45babb70fe237ad2bb/src/rpc/protocol.h#L30)

QtObject {
    id: rpc
    property string url
    property string user
    property string password

    function send(data, callback) {
        callback = callback || function(xhr) {
            if(xhr.readyState === xhr.DONE) {
                console.log("xhr.responseText:", xhr.responseText);
            }
        }

        var xhr = new  XMLHttpRequest();
        xhr.onreadystatechange = function() {
            callback(xhr);
        };
        xhr.open("POST", url, true, user, password);
        xhr.send(data);
    }

    function rpc(method, params, id, callback) {
        var data = {
            method: method,
            params: params,
            id: id
        }
        send(JSON.stringify(data), callback);
    }


    function getpeerinfo(callback) {
        rpc.rpc("getpeerinfo", undefined, null, callback);
    }

    function getrawmempool(callback) {
        rpc.rpc("getrawmempool", undefined, null, callback);
    }


    function listtransactions(callback) {
        var params = [

                ]
        rpc.rpc("listtransactions", params, null, callback)
    }


}
