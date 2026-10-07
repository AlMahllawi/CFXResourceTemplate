-- threads and timers
CreateThread(function() end)
Citizen.CreateThread(function() end)
SetTimeout(0, function() end)
Citizen.SetTimeout(0, function() end)
Wait(0)
Citizen.Wait(0)
Citizen.Trace('trace message\n')
Citizen.InvokeNative(0x9CA6C0C5, 'citizen-scripting') -- GET_RESOURCE_STATE

-- promises: Citizen.Await only works inside a thread (coroutine)
CreateThread(function()
    local p = promise.new()
    SetTimeout(100, function() p:resolve(42) end)
    local value = Citizen.Await(p)
    print(value)

    -- promise.all resolves once every promise in the list has resolved
    local a, b = promise.new(), promise.new()
    a:resolve(1)
    b:resolve(2)
    print(json.encode(Citizen.Await(promise.all({ a, b }))))
end)
