import QtQuick 2.0

import "../sqml"

Item {

    width: 320
    height: 240

    SqlQueryBuilder {
        id: builder
    }

    function test_select() {
        builder
        .select(['name', 'sum(a.id)'])
        .from('a.user')
        .where()
        .gt('a.age', 10)
        .or()
        .inValues('a.name', ['name', 'mike'])
        .orderBy(['name', 'age'])
        console.log(builder.dumpSql());
        console.log(builder.dumpBind());
    }

    function test_insert() {
        builder
        .insertInto('user', ['name', 'age'], ['mike', 10])
        console.log(builder.dumpSql());
        console.log(builder.dumpBind());

        builder
        .insertInto('user', ['make', 10])
        console.log(builder.dumpSql());
        console.log(builder.dumpBind());
    }

    function test_update() {
        builder.update('user', {
                           'name': 'mike',
                           "age": 10
                       })
        .where()
        .equals('age', 11);
        console.log(builder.dumpSql());
        console.log(builder.dumpBind());
    }

    function test_delete() {
        builder.deleteFrom('user')
        .where()
        .like('name', '%mike%');
        console.log(builder.dumpSql());
        console.log(builder.dumpBind());
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {

            test_delete();

        }
    }

}
