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

    -- TILES --
    for i, tiles in ipairs(file.tiles) do
        for x=tiles.s[1], tiles.e[1] do
            for y=tiles.s[2], tiles.e[2] do
                local px, py = boss.settings.pixels(x, y)
                Class[(tiles.n or 'decor')](boss, map.group, px, py, tiles.q, tiles.c , tiles.l or 2)
            end
        end
    end

    for i, tile in ipairs(file.tile) do
        local px, py = boss.settings.pixels(tile.x, tile.y)
        Class[(tile.n or 'decor')](boss, map.group, px, py, tile.q, tile.c, tile.l or 2)
    end

    function map.load()
        boss.group = map.group
    end

    return map
end

return Map
