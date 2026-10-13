---@meta

exports = exports or {}
local Exports = {}

---@param b number
---@return number
function Exports:StaticExport(b) end

---@param x string
---@param y string
---@return string
function Exports:InlineExport(x, y) end

function Exports:StaticName() end

exports.ResourceTemplate = Exports
