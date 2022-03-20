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

local request = userBuilder.insert("users", user)
print("Request : ", request)

