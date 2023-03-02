local BinPack = require("BinPack")

local data1<const> = "\00\01\02\03\04"
local data2<const> = "\05\06\07\08\09"
local expected<const> = "\5\0\1\2\3\4\5\5\6\a\b\t"

-- Pack the sample data
do
    local result = BinPack.pack(data1, data2)
    assert(result == expected)
    print("Packed data successfully")
end

-- Unpack the sample data
do
    local result = BinPack.unpack(expected)
    assert(result[1] == data1)
    assert(result[2] == data2)
    print("Unpacked data successfully")
end
