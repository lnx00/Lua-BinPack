# BinPack.lua

Binary packing library for Lua

## Usage

Require the library:

```lua
local BinPack = require("BinPack")
```

Pack binary strings:

```lua
local packed = BinPack.pack("\01\02\03", "\04\05\06")
```

Unpack binary strings to table:

```lua
local unpacked = BinPack.unpack(packed)
```
