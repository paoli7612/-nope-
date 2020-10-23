local Sprite = require('sprites/sprite')

function Wall(boss, x, y, q)
    local wall = Sprite(boss, x, y)
    local spritesheet = boss.spritesheet.wall
    wall.quad = spritesheet.get_quad(q[1], q[2])
    wall.color = {0, 1, 0, 1}
    wall.descrizione = 'just a wall'

    function wall.draw()
        spritesheet.draw(x, y, wall.quad)
    end

    function wall.change(x, y)
        wall.quad = spritesheet.get_quad(x, y)
    end

    return wall
end

return Wall
