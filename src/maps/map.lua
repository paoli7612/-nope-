local Group = require('sprites/group')

local Class = {
    decor = require('sprites/decor'),
    npc = require('sprites/npc'),
    floor = require('sprites/floor')
}

function Map(boss, name)
    local map = {}
    boss.group = Group(boss)
    local file = require('maps/data/'..name)

    -- NPC
    for i,npc in ipairs(file.npc) do
        x = love.math.random(4)
        y = love.math.random(4)
        sprite = Class.npc(boss, npc.x, npc.y, {x, y})
        boss.group.add(sprite)
        print(x, y)
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

    -- DECOR
    for i,sprite in ipairs(file.decor) do
        local x, y = boss.settings.pixels(sprite.x, sprite.y)
        sprite = Class['decor'](boss, x, y, sprite.q)
        boss.group.add(sprite)
    end

    -- FLOOR
    for i, floor in ipairs(file.floor) do
        for x=floor.s[1], floor.e[1] do
            for y=floor.s[2], floor.e[2] do
                local px, py = boss.settings.pixels(x, y)
                sprite = Class['floor'](boss, px, py, floor.q)
                boss.group.add(sprite, true)
            end
        end
    end


    return map
end

return Map
