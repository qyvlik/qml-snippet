import QtQuick 2.0

import "../sqml"

SqlMapping {
    id: userDaoMapping

    //@override
    function get(entity) {
        var ret = {
            "sql": "",
            "sqlArgs": []
        };

        if(typeof entity === 'undefined') {
            return ret;
        }

        ret.sql = "SELECT id, name FROM user";

        if(stringNotEmpty(entity.id)) {
            ret.sql += " WHERE id = ?"
            ret.sqlArgs.push(entity.id);
        }

        return ret;
    }

    //@override
    function getByEntity(entity) {
        return get(entity);
    }

    //@override
    function findList(entity) {
        var ret = {
            "sql": "",
            "sqlArgs": []
        };

        if(typeof entity === 'undefined') {
            return ret;
        }

        ret.sql = "SELECT id, name FROM user";

        if(stringNotEmpty(entity.id)) {
            ret.sql += " WHERE id = ?"
            ret.sqlArgs.push(entity.id);
        }

        return ret;
    }

    //@override
    function insert(entity) {
        var ret = {
            "sql": "",
            "sqlArgs": []
        };

        if(typeof entity === 'undefined') {
            return ret;
        }

        ret.sql = "INSERT INTO user VALUES(?, ?)";

        ret.sqlArgs.push(entity.id);
        ret.sqlArgs.push(entity.name);

        return ret;
    }

    //@override
    function update(entity) {
        var ret = {
            "sql": "",
            "sqlArgs": []
        };

        if(typeof entity === 'undefined') {
            return ret;
        }

        ret.sql = "UPDATE user SET id=?, name=?";

        ret.sqlArgs.push(entity.id);
        ret.sqlArgs.push(entity.name);

        return ret;
    }

    //@override
    function deleteById(entity) {
        var ret = {
            "sql": "",
            "sqlArgs": []
        };

        if(typeof entity === 'undefined') {
            return ret;
        }

        ret.sql = "DELETE FROM user WHERE id = ?";

        ret.sqlArgs.push(entity.id);

        return ret;
    }

    //@override
    function deleteRecord(entity) {
        return deleteById(entity)
    }
}
