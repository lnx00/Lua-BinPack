--[[
    BinPack.lua
    A simple binary packing library for Lua
    Author: LNX (github.com/lnx00)
]]

---@class BinPack
local BinPack = {}

-- Packs multiple byte strings into a single byte string
---@vararg string
function BinPack.pack(...)
    local args = { ... }
    local result = {}

    for _, arg in ipairs(args) do
        table.insert(result, string.char(string.len(arg)))
        table.insert(result, arg)
    end

    return table.concat(result)
end

-- Unpacks a packed byte string into multiple byte strings
---@param data string
---@return table
function BinPack.unpack(data)
    local result = {}
    local offset = 1

    while offset <= string.len(data) do
        local length = string.byte(data, offset)
        local value = string.sub(data, offset + 1, offset + length)
        table.insert(result, value)
        offset = offset + length + 1
    end

    return result
end

return BinPack
