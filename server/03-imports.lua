-- Loading modules from imports/. `load` returns an untyped value, so `@as` names the class
-- each module returns. The generated definitions carry the class's fields and methods,
-- so the same cast works in other resources that sync them
local resource = GetCurrentResourceName()

local JobSystem = assert(load(LoadResourceFile(resource, 'imports/jobSystem.lua')))() --[[@as JobSystem]]

local police = JobSystem.registerJob('police', 'Los Santos Police Department', true)
JobSystem.addJobGrade(police.name, 5, 'Chief')

local WeaponData = assert(load(LoadResourceFile(resource, 'imports/weaponData.lua')))() --[[@as WeaponData]]

local pistol = WeaponData.new(GetHashKey('WEAPON_PISTOL'),'Pistol', 'handgun')
pistol:addAttachment('COMPONENT_AT_PI_FLSH')

print(JobSystem.registeredJobs.police.label, pistol.name)
