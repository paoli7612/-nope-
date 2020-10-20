local Group = require('sprites/group')

local Npc = require('sprites/npc')
local Decor = require('sprites/decor')

function Test(boss)
    local test = Group(boss)


    function add(class, x, y, q)
        local t = boss.settings.TILE
        print(x*t + t, y*t + t)
        local sprite = class(boss, x*t + t, y*t + t, q)
        test.add(sprite)
    end

    add(Npc, 6, 6, {3, 3})

    for n=0,1 do
        for i=0,2 do
            add(Decor, i+2, n+2, {i, n+2})
        end
    end


    return test
end

return Test
