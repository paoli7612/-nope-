local Group = require('sprites/group')

local Class = {
    decor = require('sprites/decor'),
    npc = require('sprites/npc'),
    wall = require('sprites/wall')
}

function Map(boss, name)
    local map = {}
    boss.group = Group(boss)
    local file = require('maps/data/'..name)

    for i,sprite in ipairs(file.sprites) do
        sprite = Class[sprite.c](boss, sprite.x, sprite.y, sprite.q)
        boss.group.add(sprite)
    end

    -- WALLS
    for i, wall in ipairs(file.wall) do
        for x=wall.s[1], wall.e[1] do
            for y=wall.s[2], wall.e[2] do
                sprite = Class['wall'](boss, x, y, wall.q)
                boss.group.add(sprite)
            end
        end
    end

    return map
end

return Map
