import QtQuick 2.0
import "../sqml"

DataBaseConnection {
    id: database

    identifier: "QQmlExampleDB"
    version: "1.0"
    description: "The Example QML SQL!"
    estimated_size: 1000000

    Component.onCompleted: {
        transaction(function (tx){
            tx.executeSql('CREATE TABLE IF NOT EXISTS User(id TEXT, name TEXT)');
        });
    }

    Component.onDestruction:  {
        transaction(function (tx){
            tx.executeSql('DROP TABLE User');
        });
    }
}
