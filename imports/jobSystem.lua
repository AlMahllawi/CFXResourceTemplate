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
JobSystem.registeredJobs = {} ---@type table<string, JobData>

---@param name string
---@param label string
---@param isWhitelisted boolean
---@return JobData
function JobSystem.registerJob(name, label, isWhitelisted)
    local job = { name = name, label = label, isWhitelisted = isWhitelisted, grades = {} }
    JobSystem.registeredJobs[name] = job
    return job
end

---@param jobName string
---@param grade JobGrade
---@param gradeLabel string
function JobSystem.addJobGrade(jobName, grade, gradeLabel)
    if JobSystem.registeredJobs[jobName] then
        JobSystem.registeredJobs[jobName].grades[grade] = gradeLabel
    end
end

return JobSystem
