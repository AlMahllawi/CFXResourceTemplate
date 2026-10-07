---@param b number
---@return number
local function internalHelper(b)
    return b + 1
end

exports('StaticExport', internalHelper)

---@param x string
---@param y string
exports('InlineExport', function(x, y)
    local z = x
    z = z .. y
    return z
end)

exports('StaticName', function() end)

local dyn = 'Prefix'
exports(dyn .. 'Name', function() end)
