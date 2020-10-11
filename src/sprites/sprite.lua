function Sprite(x, y)
    local sprite = {}
    sprite.x = x
    sprite.y = y
    sprite.speed = 4
    sprite.dx = 0
    sprite.dy = 0
    sprite.color = {1, 1, 1, 0.8}

    function sprite.update(dt)
        sprite.x = sprite.x + sprite.speed * sprite.dx
        sprite.y = sprite.y + sprite.speed * sprite.dy
    end

    function sprite.draw()
        love.graphics.setColor(sprite.color)
        love.graphics.rectangle('fill', sprite.x, sprite.y, 25, 25)
    end

    return sprite
end

return Sprite
