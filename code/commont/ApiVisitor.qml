import QtQuick 2.0

import "./commont.js" as Commont

QtObject {

    property string appHost
    property string appVersion
    property string lan

    function get(path, query, callback) {
        callback = callback || function(xhr) {
            console.log(xhr.responseText);
        };

        var queryParams = Commont.urlQuery(query);
        var headers = {
            "Content-Type":"application/x-www-form-urlencoded;charset=utf-8",
        }

        var url = appHost + path + "?" + queryParams;

        Commont.ajax("GET", url, headers, "", callback);
    }

    function post(path, postData, callback) {
        callback = callback || function(xhr) {
            console.log(xhr.responseText);
        };

        postData = Commont.urlQuery(postData);

        postData = JSON.stringify(postData);

        var headers = {
            "Content-Type":"application/json; charset=UTF-8"
        }

        var url = appHost + path;

        console.log("url:", url);

        console.log("postData:", postData);

        Commont.ajax("POST", url, headers, postData, callback);
    }

}
