local Player = require('sprites/player')

function Boss()
    local boss = {}

    boss.player = Player()

    return boss
end

return Boss
