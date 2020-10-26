local Sprite = require('sprites/sprite')

function Decor(boss, group, x, y, q, collider, layer)
    local decor = Sprite(boss, group, x, y, collider, layer)
    local spritesheet = boss.spritesheet
    decor.quad = spritesheet.get_quad(q[1], q[2])
    decor.color = {0, 1, 0, 1}
    decor.descrizione = 'just a decor'

    function decor.draw()
        spritesheet.draw(x, y, decor.quad)
    end

    function decor.change(x, y)
        decor.quad = spritesheet.get_quad(x, y)
    end

    return decor
end

return Decor
