---@meta

---@enum JobGrade
local JobGrade = {
    Recruit = 1,
    Officer = 2,
    Sergeant = 3,
    Lieutenant = 4,
    Boss = 5
}

---@class JobData
---@field name string The internal job identifier (e.g. "police")
---@field label string The display name (e.g. "Los Santos Police Department")
---@field isWhitelisted boolean
---@field grades table<number, string> Map of grade level to grade label

---@class JobSystem
local JobSystem = {}

---@type table<string, JobData>
JobSystem.registeredJobs = {}

---@param name string
---@param label string
---@param isWhitelisted boolean
---@return JobData
function JobSystem.registerJob(name, label, isWhitelisted) end

---@param jobName string
---@param grade JobGrade
---@param gradeLabel string
function JobSystem.addJobGrade(jobName, grade, gradeLabel) end

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
function WeaponData.new(hash, name, category) end

---@param attachmentId string
function WeaponData:addAttachment(attachmentId) end

---@class ServerManager
---@field players table<string, PlayerData>
local ServerManager = {}

---@param identifier string
---@return PlayerData?
function ServerManager:GetPlayer(identifier) end

---@class PlayerData
---@field identifier string
---@field group string
---@field inventory table
local PlayerData = {}
