#!/usr/bin/lua5.1


local spawn_args = {}
-- 	"bash", 
-- 	"/drive_d/work/bin/dbl.sh", 
-- 	text
-- };

-- Display the command line parameters
-- print(arg[0])    -- Name of the script
-- print(arg[1])    -- First parameter
-- print(arg[2])    -- Second parameter
-- tprint(arr)
-- local ret = table.concat(arr, " ")
-- table.insert(spawn_args, ret)
local ret = table.concat(arg, " ")
-- local arr = {
-- 	111, [["222"]]
-- }
-- require "tprint"
-- tprint(arg)
-- for i,v in ipairs(arg) do
-- 	print(i,v)
-- end
-- print("111111111")

-- print(arg.n)
-- print(ret)
os.execute(ret)
