local Parameter = require('sprites/stats/parameter')

function Stats(boss)
    local stats = {}

    stats.life = Parameter(100)
    stats.magic = Parameter(50)

    function stats.draw(x, y)
        if boss.settings.stats then
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.rectangle('fill', x, y-40, boss.settings.TILE+25, 35)
            love.graphics.setColor(1, 0, 0, 1)
            love.graphics.print(stats.life.text(), x, y-20)
            love.graphics.setColor(0, 1, 0, 1)
            love.graphics.print(stats.life.text(), x, y-30)
            love.graphics.setColor(0, 0, 1, 1)
            love.graphics.print(stats.magic.text(), x, y-40)
        end
    end

    return stats
end

return Stats
