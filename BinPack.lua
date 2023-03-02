---@class BinPack
local BinPack = {}

---@vararg string
function BinPack.pack(...)
    local args = { ... }
    local result = {}

    for _, arg in ipairs(args) do
        table.insert(result, arg)
    end

    return table.concat(result)
end

return BinPack
