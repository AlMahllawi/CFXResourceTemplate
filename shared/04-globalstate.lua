GlobalState.a = true
print(GlobalState.a)

GlobalState['b'] = true
print(GlobalState['b'])

-- Server-only: set with replication to every client
if IsDuplicityVersion() then
    GlobalState:set('currentWeather', 'EXTRASUNNY', true)
end

-- React to changes in any bag for a given key
AddStateBagChangeHandler('isDead', '', function(bagName, key, value)
    print(bagName, key, value)
end)
