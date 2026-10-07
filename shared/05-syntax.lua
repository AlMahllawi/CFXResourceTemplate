-- CfxLua syntax extensions (enabled through runtime.nonstandardSymbol and the addon plugin)

/* C-style block comment */

-- Backtick hashes are compiled to the Jenkins (joaat) hash at load time
local adder = `adder`
assert(adder == joaat('adder'))

local models = {
    [`police`] = 'Police Cruiser',
    [`ambulance`] = 'Ambulance',
}
print(models[`police`])

-- Compound assignment operators
local n = 10
n += 5
n -= 3
n *= 2
n /= 4

local flags = 0x0F
flags <<= 2
flags >>= 1
flags &= 0xFF
flags |= 0x100

local power = 2
power ^= 3

-- Safe navigation (foo?.bar and foo?[bar])
local config = { shop = { items = { 'water' } } }
print(config?.shop?.items?[1])
print(config?.missing?.items)

-- Standard Lua 5.4 features that also work in CfxLua
local MAX_ITEMS <const> = 10
print(MAX_ITEMS // 3, n, flags, power)

do
    local file <close> = setmetatable({}, { __close = function() print('closed') end })
    print(file)
end
