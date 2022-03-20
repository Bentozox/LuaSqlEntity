CONFIG = {
    VERSION = "0.0"
}

SqlBuilder = require("modules/SqlBuilder/SqlBuilder")

userBuilder = SqlBuilder("users")


local user = {
    name = "Benjamin",
    money = 2034
}

userBuilder.insert(user)

