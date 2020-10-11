function Sprite(x, y)
    local sprite = {}
    sprite.x = x
    sprite.y = y
    sprite.speed = 3
    sprite.dx = 0
    sprite.dy = 0

    function sprite.update(dt)
        sprite.x = sprite.x + sprite.speed * sprite.dx
        sprite.y = sprite.y + sprite.speed * sprite.dy
    end

    function sprite.draw()
            love.graphics.rectangle('fill', sprite.x, sprite.y, 50, 50)
    end

    return sprite
end

return Sprite
