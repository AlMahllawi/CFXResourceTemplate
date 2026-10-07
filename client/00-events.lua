-- Round trip: template:request -> server -> template:notify to every client
RegisterNetEvent('template:notify', function(message)
    print(message)
end)

RegisterNetEvent('template:bigPayload', function(payload)
    print(#payload.data)
end)

TriggerServerEvent('template:request')

-- Latent events are sent in chunks at the given bytes per second, for large payloads
TriggerLatentServerEvent('template:upload', 1000, { data = string.rep('x', 1024) })
