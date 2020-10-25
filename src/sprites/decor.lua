local Sprite = require('sprites/sprite')

function Decor(boss, x, y, q)
    local decor = Sprite(boss, x, y)
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
