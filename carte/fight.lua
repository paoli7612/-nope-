local Player = require('player')

function Fight(boss)
    local fight = {}

    p1 = Player(boss, 'Nespola', 10, 10)
    p2 = Player(boss, 'Susina', 10, 310)

    function fight.update(dt)
    end

    function fight.draw()
        p1.draw()
        p2.draw()
    end

    return fight
end

return Fight
