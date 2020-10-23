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
    for i,sprite in ipairs(file) do
        sprite = Class[sprite.c](boss, sprite.x, sprite.y, sprite.q)
        boss.group.add(sprite)
    end

    return map
end

return Map
