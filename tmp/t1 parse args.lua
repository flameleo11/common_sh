#!/usr/bin/lua5.1


local text = [[
I "am" 'hello world' and "most of this"
 will be a \'bug\' and "not easy to find"
]]

-- text = [[I am 'the text' and '' here is "another text in quotes" and this is the end]]




local e = 0
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
    print("["..text:sub(b,e-1).."]")
end


-- local spat, epat, buf, quoted = [=[^(['"])]=], [=[(['"])$]=]
-- for str in text:gmatch("%S+") do
--   local squoted = str:match(spat)
--   local equoted = str:match(epat)
--   local escaped = str:match([=[(\*)['"]$]=])
--   -- print(str, squoted, equoted, escaped)
--   if squoted and not quoted and not equoted then
--     buf, quoted = str, squoted
--   elseif buf and equoted == quoted and #escaped % 2 == 0 then
--     str, buf, quoted = buf .. ' ' .. str, nil, nil
--   elseif buf then
--     buf = buf .. ' ' .. str
--   end
--   if not buf then print((str:gsub(spat,""):gsub(epat,""))) end
-- end

-- if buf then print("Missing matching quote for "..buf) end