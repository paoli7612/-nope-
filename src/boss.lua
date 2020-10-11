local Player = require('sprites/player')
local Npc = require('sprites/npc')

function Boss()
    local boss = {}

    boss.player = Player()
    boss.npc = Npc()

    return boss
end

return Boss
