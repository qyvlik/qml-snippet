import QtSensors 5.1
import QtQuick 2.0

import "./3rdparty/ckknight/random-js/lib/random.js" as RandomLib

Item {

    Component.onCompleted: {
        var Random = RandomLib.Random;

        var mt = Random.engines.mt19937();
        var d = mt();
        d = mt.seed(1);

        console.log(d())
    }

}
