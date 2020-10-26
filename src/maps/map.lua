local Group = require('sprites/group')

local Class = {
    decor = require('sprites/decor'),
    npc = require('sprites/npc'),
    floor = require('sprites/floor')
}

function Map(boss, name)
    local map = {}
    map.group = Group(boss)
    local file = require('maps/data/'..name)

    -- NPC
    for i,npc in ipairs(file.npc) do
        qx = love.math.random(4)
        qy = love.math.random(4)
        x, y = boss.settings.pixels(npc.x, npc.y)
        sprite = Class.npc(boss, map.group, x, y, {qx, qy}, npc.l)
    end

    -- WALLS
    for i, wall in ipairs(file.wall) do
        for x=wall.s[1], wall.e[1] do
            for y=wall.s[2], wall.e[2] do
                local px, py = boss.settings.pixels(x, y)
                sprite = Class['decor'](boss, map.group, px, py, wall.q, wall.c, wall.l)
            end
        end
    end

    -- DECOR
    for i,sprite in ipairs(file.decor) do
        local x, y = boss.settings.pixels(sprite.x, sprite.y)
        sprite = Class['decor'](boss, map.group, x, y, sprite.q, sprite.c, 1)
    end

    -- FLOOR
    for i, floor in ipairs(file.floor) do
        for x=floor.s[1], floor.e[1] do
            for y=floor.s[2], floor.e[2] do
                local px, py = boss.settings.pixels(x, y)
                sprite = Class['floor'](boss, map.group, px, py, floor.q, floor.c, 1)
            end
        end
    end

    function map.load()
        boss.sprites = map.group
    end

    return map
end

return Map
