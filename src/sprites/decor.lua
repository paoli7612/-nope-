local Sprite = require('sprites/sprite')

function Decor(boss, x, y)
    local decor = Sprite(boss, x, y)
    decor.color = {0, 1, 0, 1}

    return decor
end

return Decor
