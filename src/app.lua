CONFIG = {
    VERSION = "0.0",
    DEFAULT_BUILDER = require("modules/SqlBuilder/services/mysql/MySqlBuilder")
}




SqlBuilder = require("modules/SqlBuilder/SqlBuilder")

userBuilder = SqlBuilder.newInstanceWithService(
                    CONFIG.DEFAULT_BUILDER()
                )


local user = {
    name = "Benjamin",
    money = 2034
}

local insertRequest = userBuilder.insert("users", user)
print("Insert Request : ", insertRequest)


local deleteRequest = userBuilder.delete("users", user)
print("Delete Request : ", deleteRequest)


local selectRequest = userBuilder.select("users", user, {"name"})
print("Select Request : ", selectRequest)
