-- Calling exports: dot access, and bracket access for resource names with dashes
exports.someResource:someExport(1)
exports['some-resource']:someExport(1)

-- This resource's own exports are server-only, typed by the generated definitions
if IsDuplicityVersion() then
    print(exports[GetCurrentResourceName()]:StaticExport(1))
end
