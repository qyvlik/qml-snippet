Qt.include("../crypto-js/crypto-js.js")

function proofOfWork(message) {
    var i = 0;
    var flag = false;
    while(true) {
        var hashString = CryptoJS.SHA256(message+i).toString();
        var head = hashString .substring(0, 5);
        console.log("head", head, "i:", i);
        if(head  === "00000") {
            return i;
        }
        i++;
    }
}

WorkerScript.onMessage = function(message) {
    console.time("proofOfWork");
    var randomI = proofOfWork(message);
    console.timeEnd("proofOfWork");
    WorkerScript.sendMessage({'data' : randomI.toString()})
}
