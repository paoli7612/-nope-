function Sprite(x, y)
    local sprite = {}
    sprite.x = x
    sprite.y = y

    function sprite.update()
    end

    function sprite.draw()
    end

    return sprite
end

return Sprite
