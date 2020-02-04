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
	    table.insert(arr, text:sub(b,e-1))
	end
	return arr
end

-----------------------------------------------------------
-- 
-----------------------------------------------------------

require "tprint"

local text = [[
I "am" 'hello world' and "most of this"
 will be a \'bug\' and "not easy to find"
]]

-- text = [[I am 'the text' and '' here is "another text in quotes" and this is the end]]

local spawn_args = {
	"bash", 
	"/drive_d/work/bin/dbl.sh", 
	arg[1]
};

-- spawn_args
local text = arg[1]
local arr = parse_shell_args(text)
-- os.excute()
-- Display the command line parameters
-- print(arg[0])    -- Name of the script
-- print(arg[1])    -- First parameter
-- print(arg[2])    -- Second parameter
tprint(arr)

