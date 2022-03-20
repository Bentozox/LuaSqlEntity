---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by benjamin.
--- DateTime: 20/03/22 22:10
---

-- Object constructor of SqlParser. Use this object to parse SQL request (Object to SQL)
-- @param iBuilderService {IBuilder} Service to use
-- @see IBuilder
function newInstanceWithService(iBuilderService)
    local this = {}

    -- @param tableName {string} Name of database table
    -- @return string Constructed request
    this.insert = function(tableName, object)
        -- TODO : Verify if object is nil or empty
        return iBuilderService.insert(tableName, object)
    end

    return this;
end

-- Object constructor of SqlParser. Use this object to parse SQL request (Object to SQL). Default service is MySql
function newInstance()
    return CONFIG.DEFAULT_BUILDER()
end


return {
    newInstanceWithService = newInstanceWithService,
    newInstance = newInstance
}