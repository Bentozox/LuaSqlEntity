---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by benjamin.
--- DateTime: 20/03/22 23:00
---

local IBuilder = require("modules/SqlBuilder/IBuilder")
local StringJoiner = require("modules/SqlBuilder/StringJoiner")

--
function parseData(data)
    if type(data) == "string" then
        return "'" .. data .. "'"
    elseif type(data) == "number" then
        return data
    end
end

local MysqlBuilder = function()


    -- @param tableName {string} Name of database table
    -- @param object {table} Key & Value put in WHERE clause
    -- @param columns {array} Columns to select
    local function select(tableName, object, columns)
        local columnsSelect
        local whereJoiner = StringJoiner("", ", ", "")

        -- Prepare select
        if #columns == 0 then
            columnsSelect = "*"
        else
            local colSelJoiner = StringJoiner("", ", ", "")

            for _, column in pairs(columns) do
                colSelJoiner.append(column)
            end

            columnsSelect = colSelJoiner.toString()
        end

        -- Prepare WHERE clause
        for column, value in pairs(object) do
            whereJoiner.append(column .. "=" .. parseData(value))
        end

        if whereJoiner.getSize() == 0 then
            return "SELECT " .. columnsSelect .. " FROM " .. tableName
        end
        return "SELECT " .. columnsSelect .. " FROM " .. tableName .. " WHERE " .. whereJoiner.toString()
    end

    -- @param tableName {string} Name of database table
    local function insert(tableName, object)
        local keyJoiner = StringJoiner("(", ", ", ")")
        local valueJoiner = StringJoiner("(", ", ", ")")

        for column, value in pairs(object) do
            keyJoiner.append(column)
            valueJoiner.append(parseData(value))
        end

        return "INSERT INTO " .. tableName .. " " .. keyJoiner.toString() .. " VALUES " .. valueJoiner.toString()
    end


    -- @param tableName {string} Name of database table
    local function delete(tableName, object)
        local joiner = StringJoiner("", ", ", "")

        for column, value in pairs(object) do
            joiner.append(column .. "=" .. parseData(value))
        end

        if joiner.getSize() == 0 then
            return "DELETE FROM " .. tableName
        end

        return "DELETE FROM " .. tableName .. " WHERE " .. joiner.toString()
    end


    return IBuilder.newInstance(select, insert, delete)
end



return MysqlBuilder