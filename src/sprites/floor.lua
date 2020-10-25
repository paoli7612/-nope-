local Sprite = require('sprites/sprite')

function Floor(boss, x, y, q)
    local floor = Sprite(boss, x, y)
    local spritesheet = boss.spritesheet
    floor.quad = spritesheet.get_quad(q[1], q[2])

    function floor.draw()
        spritesheet.draw(x, y, floor.quad)
    end

    return floor
end

return Floor
