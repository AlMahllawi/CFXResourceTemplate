---@alias WeaponCategory "melee" | "handgun" | "submachine" | "shotgun" | "assault" | "sniper" | "heavy" | "thrown"

---@class WeaponAttachment
---@field id string The attachment component string (e.g. "COMPONENT_AT_AR_FLSH")
---@field name string The display name of the attachment
---@field description? string

---@class WeaponData
---@field hash number The Jenkins hash of the weapon
---@field name string The display name
---@field category WeaponCategory
---@field damage number Base damage
---@field attachments? WeaponAttachment[]
local WeaponData = {}

---@param hash number
---@param name string
---@param category WeaponCategory
---@return WeaponData
function WeaponData.new(hash, name, category)
    return { hash = hash, name = name, category = category, damage = 0.0, attachments = {} }
end

---@param attachmentId string
function WeaponData:addAttachment(attachmentId)
    table.insert(self.attachments, { id = attachmentId, name = "Unknown" })
end

return WeaponData
