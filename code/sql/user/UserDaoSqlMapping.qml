import QtQuick 2.0

import "../sqml"

SqlMapping {
    id: userDaoMapping

    //@override
    function get(entity) {

        sqlQueryBuilder.select(['id', 'name'])
        .from('user');

        if(stringNotEmpty(entity.id)) {
            sqlQueryBuilder.where();
            sqlQueryBuilder.equals('id', entity.id);
        }

        return sqlQueryBuilder.dump();
    }

    //@override
    function getByEntity(entity) {
        return get(entity);
    }

    //@override
    function findList(entity) {

        sqlQueryBuilder.select(['id', 'name'])
        .from('user');

        if(stringNotEmpty(entity.id)) {
            sqlQueryBuilder.where();
            sqlQueryBuilder.equals('id', entity.id);
        }

        return sqlQueryBuilder.dump();
    }

    //@override
    function insert(entity) {
        sqlQueryBuilder.insertInto('user',
                                   ['id', 'name'],
                                   [entity.id, entity.name]);

        return sqlQueryBuilder.dump();
    }

    //@override
    function update(entity) {
        sqlQueryBuilder.update('user', {
                                   'name': entity.name
                               })
        .where()
        .equals('id', entity.id);

        return sqlQueryBuilder.dump();
    }

    //@override
    function deleteById(entity) {
        sqlQueryBuilder.deleteFrom('user')
        .where()
        .equals('id', entity.id);

        return sqlQueryBuilder.dump();
    }

    //@override
    function deleteRecord(entity) {
        return deleteById(entity)
    }
}
