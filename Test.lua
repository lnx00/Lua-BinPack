local BinPack = require("BinPack")

local data1<const> = "\00\01\02\03\04"
local data2<const> = "\05\06\07\08\09"

-- Pack the sample data
do
    local result = BinPack.pack(data1, data2)
    assert(result == "\00\01\02\03\04\05\06\07\08\09", "Packed data does not match expected result")
    print("Packed data successfully")
end
