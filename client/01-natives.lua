-- Loads a model by its backtick hash, then spawns it next to the player
---@param model integer
---@return boolean
local function loadModel(model)
    if not IsModelInCdimage(model) then return false end

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    return true
end

RegisterCommand('spawncar', function(_, args)
    local model = args[1] and joaat(args[1]) or `adder`
    if not loadModel(model) then return end

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, GetEntityHeading(ped), true, false)
    SetPedIntoVehicle(ped, vehicle, -1)
    SetModelAsNoLongerNeeded(model)
end, false)

-- State bags on the local player
LocalPlayer.state:set('isHandcuffed', false, true)
print(LocalPlayer.state.isHandcuffed)
