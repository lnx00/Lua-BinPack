local BinPack = require("BinPack")

local data1<const> = "\00\01\02\03\04"
local data2<const> = "\05\06\07\08\09"
local expected<const> = "5\0\0\1\2\3\0045\0\5\6\a\b\t"

-- Pack the sample data
do
    local result = BinPack.pack(data1, data2)
    assert(result == expected)
    print("[TEST] Packed data successfully")
end

-- Unpack the sample data
do
    local result = BinPack.unpack(expected)
    assert(result[1] == data1)
    assert(result[2] == data2)
    print("[TEST] Unpacked data successfully")
end

-- Pack and save the sample data
do
    BinPack.save("test.bin", data1, data2)
    local file = io.open("test.bin", "rb")
    assert(file)
    assert(file:read("*a") == expected)
    file:close()
    print("[TEST] Saved data successfully")
end

-- Load and unpack the sample data
do
    local result = BinPack.load("test.bin")
    assert(result)
    assert(result[1] == data1)
    assert(result[2] == data2)
    print("[TEST] Loaded data successfully")
end

-- Pack multiple files
do
    local success = BinPack.packFiles("images.dat", "cat.png", "dog.png")
    assert(success)
    print("[TEST] Packed files successfully")
end

-- Delete the sample data file
os.remove("test.bin")
