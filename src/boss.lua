local Player = require('sprites/player')
local Npc = require('sprites/npc')

function Boss()
    local boss = {}
    
    boss.player = Player(boss)
    boss.npc = Npc(boss)

    return boss
end

return Boss
