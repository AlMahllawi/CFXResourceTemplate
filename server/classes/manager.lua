---@class ServerManager
---@field players table<string, PlayerData>
local ServerManager = {}

---@param identifier string
---@return PlayerData?
function ServerManager:GetPlayer(identifier)
    return self.players[identifier]
end
