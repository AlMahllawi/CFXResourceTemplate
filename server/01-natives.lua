-- Server-side entity creation with a backtick hash
local vehicle = CreateVehicleServerSetter(`adder`, 'automobile', 0.0, 0.0, 72.0, 0.0)

-- Entity state bags, replicated to clients
Entity(vehicle).state:set('fuel', 100.0, true)
print(Entity(vehicle).state.fuel)

-- Player state bags
AddEventHandler('playerJoining', function()
    Player(source).state:set('activeJob', 'unemployed', true)
end)

-- Awaited HTTP request (must run in a thread)
CreateThread(function()
    local status, body = PerformHttpRequestAwait('https://example.com')
    print(status, body)
end)

-- Players and their identifiers
for _, playerId in ipairs(GetPlayers()) do
    local src = tonumber(playerId) --[[@as integer]]
    print(GetPlayerName(src), json.encode(GetPlayerIdentifiers(src)))
end

-- Callback HTTP request
PerformHttpRequest('https://example.com', function(status, body)
    print(status, body)
end, 'GET')
