RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    cb({ ok = true, received = data })
end)

SendNUIMessage({ action = 'open', items = { 'water', 'bread' } })
SetNuiFocus(true, true)
