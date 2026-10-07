---@class VehicleData
---@field modelHash number
---@field plate string
---@field fuelLevel number
local VehicleData = {}

---@param modelHash number
---@param plate string
---@param fuelLevel? number
---@return VehicleData
function VehicleData.new(modelHash, plate, fuelLevel)
    return { modelHash = modelHash, plate = plate, fuelLevel = fuelLevel or 100.0 }
end

return VehicleData
