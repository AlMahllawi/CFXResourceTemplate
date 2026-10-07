-- Round trip: template:request from a client -> template:notify to every client
RegisterNetEvent('template:request', function()
    local src = source
    TriggerClientEvent('template:notify', -1, ('%s joined'):format(GetPlayerName(src)))
    TriggerLatentClientEvent('template:bigPayload', src, 1000, { data = string.rep('x', 1024) })
end)

RegisterNetEvent('template:upload', function(payload)
    print(GetPlayerName(source), #payload.data)
end)
