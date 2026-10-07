-- Local event handlers, removable through the returned handle
local handler = AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    print(('%s started'):format(resourceName))
end)
RemoveEventHandler(handler)

-- RegisterNetEvent also lets the other side trigger this event over the network
RegisterNetEvent('template:sync', function(payload)
    print(json.encode(payload))
end)
TriggerEvent('template:sync', { ok = true })
