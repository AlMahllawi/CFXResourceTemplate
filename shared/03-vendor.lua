-- json
local encoded = json.encode({ a = 1, b = { 1, 2, 3 } }, { indent = true })
local decoded = json.decode(encoded)
print(decoded.a)

-- msgpack
local packed = msgpack.pack({ 1, 2, 3 })
print(msgpack.unpack(packed))

-- vectors
local v1 = vec(1.0)
local v2 = vector2(1.0, 2.0)
local v2s = vec2(1.0)
local v3 = vector3(1.0, 2.0, 3.0)
local v3s = vec3(1.0, 2.0, 3.0)
local v4 = vector4(1.0, 2.0, 3.0, 4.0)
local v4s = vec4(v3s.x, v3s.y, v3s.z, 90.0)

-- quaternions
local identity = quat()
local q = quat(1.0, 0.0, 0.0, 0.0)
local rotated = quat(90.0, vector3(0.0, 0.0, 1.0))

-- vector math, swizzling and length operator
local sum = v3 + v3s
local scaled = v3 * 2.0
local xy = v4.xy
local distance = #(v3 - v3s)

print(v1, v2, v2s, v4, v4s, identity, q, rotated, sum, scaled, xy, distance)

-- Jenkins one-at-a-time hashing at runtime
print(joaat('adder'), GetHashKey('adder'))
