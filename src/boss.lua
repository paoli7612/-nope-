-- Inrerface
local Interface = require('interface/interface')

-- Sprites
local Group = require('sprites/group')

local Player = require('sprites/player')
local Npc = require('sprites/npc')

function Boss()
    local boss = {}
    boss.interface = Interface()
    boss.settings = require('settings')
    boss.group = Group(boss) -- contiene tutti gli sprite

    boss.player = Player(boss, 100, 100)
    boss.group.add(Npc(boss, 400, 500))
    boss.group.add(Npc(boss, 700, 200))

    return boss
end

return Boss
