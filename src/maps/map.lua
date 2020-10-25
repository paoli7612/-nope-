local Group = require('sprites/group')

local Class = {
    decor = require('sprites/decor'),
    npc = require('sprites/npc'),
}

function Map(boss, name)
    local map = {}
    boss.group = Group(boss)
    local file = require('maps/data/'..name)

    -- DECOR
    for i,sprite in ipairs(file.decor) do
        sprite = Class['decor'](boss, sprite.x, sprite.y, sprite.q)
        boss.group.add(sprite)
    end

    -- WALLS
    for i, wall in ipairs(file.wall) do
        for x=wall.s[1], wall.e[1] do
            for y=wall.s[2], wall.e[2] do
                local px, py = boss.settings.pixels(x, y)
                sprite = Class['decor'](boss, px, py, wall.q)
                boss.group.add(sprite)
            end
        end
    end

    return map
end

return Map
