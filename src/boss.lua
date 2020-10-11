local Spritesheet = require('spritesheet')

local Player = require('sprites/player')
local Npc = require('sprites/npc')


function Boss()
    local boss = {}
    boss.spritesheet = Spritesheet('npc')

    boss.player = Player(boss)
    boss.npc = Npc(boss)

    return boss
end

return Boss
