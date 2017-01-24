import QtQuick 2.0
import "../sqml"

CrudService {
    id: userService

    __dao: UserDao {
        id: userDao
        connection: userService.connection
    }
}
