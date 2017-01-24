import QtQuick 2.0
import "../sqml"

SqlMapping {
    id: userDaoMapping

    getById: "SELECT id, name FROM user WHERE id = ?"
    getByIdArgs: entity ? [ entity ] : []

    get: "SELECT id, name FROM user WHERE id = ?"
    getArgs: entity ? [ entity.id ] : []

    findList: ""
    findListArgs: ""

    findAllList: ""
    findAllListArgs: ""

    insert: "INSERT INTO user(name, id) VALUES(?, ?)"
    insertArgs: entity ? [ entity.name, entity.id] : []

    update: ""
    updateArgs: ""

    deleteById: ""
    deleteByIdArgs: ""

    deleteRecord: ""
    deleteRecordArgs: ""
}
