import QtQuick 2.0

import "../sqml"

CrudService {
    id: userService

    __dao: UserDao {
        __connection: userService.connection
        debug: userService.debug
    }
}
