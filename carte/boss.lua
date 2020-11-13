local Fight = require('fight')

function Boss()
    local boss = {}

    boss.WIDTH = 600
    boss.HEIGHT = 500
    boss.C_W = 32*2
    boss.C_H = 48*2
    boss.C_M = 20

    love.window.setMode(600, 500)

    boss.fight = Fight(boss)

    function boss.update(dt)
        boss.fight.update(dt)
    end

    function boss.draw()
        boss.fight.draw()
    end

    function boss.click(x, y)
        print("Click", x, y)
    end

    return boss
end

return Boss
