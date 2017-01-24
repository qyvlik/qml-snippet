import QtQuick 2.0

QtObject {
    id: sqlMapping
    property var entity

    property string getById
    property var getByIdArgs

    property string get
    property var getArgs

    property string findList
    property var findListArgs

    property string findAllList
    property var findAllListArgs

    property string insert
    property var insertArgs

    property string update
    property var updateArgs

    property string deleteById
    property var deleteByIdArgs

    property string deleteRecord
    property var deleteRecordArgs
}
