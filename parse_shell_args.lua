#!/usr/bin/lua5.1

function parse_shell_args(text)
	local e = 0
	local arr = {}
	while true do
	    local b = e+1
	    b = text:find("%S",b)
	    if b==nil then break end
	    if text:sub(b,b)=="'" then
	        e = text:find("'",b+1)
	        b = b+1
	    elseif text:sub(b,b)=='"' then
	        e = text:find('"',b+1)
	        b = b+1
	    else
	        e = text:find("%s",b+1)
	    end
	    if e==nil then e=#text+1 end
	    -- print("["..text:sub(b,e-1).."]")
	    local str = text:sub(b,e-1);
	    -- table.insert(arr, ([["%s"]]):format(str))
	    table.insert(arr, ("%q"):format(str))

	end
	return arr
end

-----------------------------------------------------------
-- 
-----------------------------------------------------------


local text = [[
I "am" 'hello world' and "most of this"
 will be a \'bug\' and "not easy to find"
]]

-- text = [[I am 'the text' and '' here is "another text in quotes" and this is the end]]



-- lua /drive_d/work/bin/parse_shell_args.lua
-- spawn_args
local text = arg[1]
-- local text = [["everything search copy" "1 print str"]]
local arr = parse_shell_args(text)

local spawn_args = {
	"bash", 
	"/drive_d/work/bin/dbl.sh", 
	text
};


-- Display the command line parameters
-- print(arg[0])    -- Name of the script
-- print(arg[1])    -- First parameter
-- print(arg[2])    -- Second parameter
-- tprint(arr)
local ret = table.concat(arr, " ")
-- table.insert(spawn_args, ret)
local ret = table.concat(spawn_args, " ")

-- require "tprint"
-- tprint(arr)

os.execute(ret)
print(ret)
