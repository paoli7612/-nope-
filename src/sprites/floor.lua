local Sprite = require('sprites/sprite')

function Floor(boss, group, x, y, q, collider, layer)
    local floor = Sprite(boss, group, x, y, false, layer)
    local spritesheet = boss.spritesheet
    floor.quad = spritesheet.get_quad(q[1], q[2])

    function floor.draw()
        spritesheet.draw(x, y, floor.quad)
    end

    return floor
end

return Floor
