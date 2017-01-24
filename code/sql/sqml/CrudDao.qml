import QtQuick 2.0

QtObject {
    property DataBaseConnection connection: null

    property SqlMapping sqlMapping: null

    function getById(id, callback, error) {
        // callback(result)
        __executeSql(id, "getById", "getByIdArgs",
                     true,
                     function(results){
                         if(results.rows.length > 1) {
                             throw "getById should be only one result, result size: "
                                     + results.rows.length;
                         }
                         callback(results.rows.item(0));
                     }, error);
    }

    function get(entity, callback, error) {
        // callback(result)
        __executeSql(entity, "get", "getArgs",
                     true, function(results){
                         if(results.rows.length > 1) {
                             throw "getById should be only one result, result size: "
                                     + results.length;
                         }
                         callback(results.item(0));
                     }, error);
    }

    function findList(entity, callback, error) {
        // callback(resultList)
        __executeSql(entity, "findList", "findListArgs",
                     true, function(results){
                         var resultList = [];
                         for(var i = 0; i < results.rows.length; i++) {
                             resultList.push(results.rows.item(i));
                         }
                         callback(resultList);
                     }, error);
    }

    function findAllList(entity, callback, error) {
        // callback(resultList)
        __executeSql(entity, "findAllList", "findAllListArgs",
                     true, function(results){
                         var resultList = [];
                         for(var i = 0; i < results.rows.length; i++) {
                             resultList.push(results.rows.item(i));
                         }
                         callback(resultList);
                     }, error);
    }

    function insert(entity, callback, error) {
        // callback(rowsAffected)
        __executeSql(entity, "insert", "insertArgs",
                     false, function(results){
                         callback(results.rowsAffected);
                     }, error);
    }

    function update(entity, callback, error) {
        // callback(rowsAffected)
        __executeSql(entity, "update", "updateArgs",
                     false, function(results){
                         callback(results.rowsAffected);
                     }, error);
    }

    function deleteById(id, callback, error) {
        // callback(rowsAffected)
        __executeSql(entity, "deleteById", "deleteByIdArgs",
                     false, function(results){
                         callback(results.rowsAffected);
                     }, error);
    }

    function deleteRecord(entity, callback, error) {
        // callback(rowsAffected)
        __executeSql(entity, "deleteRecord", "deleteRecordArgs",
                     false, function(results){
                         callback(results.rowsAffected);
                     }, error);
    }

    function __check(entity) {
        return connection != null
                && sqlMapping != null
                && typeof entity !== 'undefined';
    }

    function __executeSql(entity, sqlStringName, sqlArgsName, readOnly, callback, error) {
        if(!__check(entity)) {
            error("check error");
            return;
        }

        sqlMapping.entity = entity;
        var sql = sqlMapping[sqlStringName];
        var sqlArgs = sqlMapping[sqlArgsName];
        sqlMapping.entity = undefined;

        console.debug("sql : ", sql, " sqlArgs:", sqlArgs);

        var transaction = readOnly ? connection.readTransaction
                                   : connection.transaction;
        transaction(function(tx){
            try {
                var resultList = tx.executeSql(sql, sqlArgs);
                console.debug("resultList lenght : ", resultList.rows.length
                              , " rowsAffected : ", resultList.rowsAffected
                              , " insertId : ", resultList.insertId);
                callback(resultList);
            } catch(e) {
                error(e);
            }
        });
    }
}
