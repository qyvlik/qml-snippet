import QtQuick 2.0

QtObject {
    id: service

    property DataBaseConnection connection
    readonly property alias dao: service.__dao

    property CrudDao __dao

    function getById(id, callback) {
        dao.getById(id, callback, __throwError);
    }

    function get(entity, callback) {
        dao.get(entity, callback, __throwError);
    }

    function findList(entity, callback) {
        dao.findList(entity, callback, __throwError);
    }

    function findAllList(entity, callback) {
        dao.findAllList(entity, callback, __throwError);
    }

    function insert(entity, callback) {
        dao.insert(entity, callback, __throwError);
    }

    function update(entity, callback) {
        dao.update(entity, callback, __throwError);
    }

    function deleteById(id, callback) {
        dao.deleteById(id, callback, __throwError);
    }

    function deleteRecord(entity, callback) {
        dao.deleteRecord(entity, callback, __throwError);
    }

    function __throwError(e) {
        console.trace();
        console.log(e)
        throw e;
    }
}
