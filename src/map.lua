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

    for n=2,4 do
        for i=0,2 do
            add(Decor, i+5, n, {i, n})
        end
    end


    return test
end

return Test
