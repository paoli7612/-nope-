function Sprite(boss, x, y)
    local sprite = {}
    sprite.x = x
    sprite.y = y
    sprite.speed = 1
    sprite.dx = 0
    sprite.dy = 0
    sprite.color = {1, 0, 1, 0.8}

    function sprite.update(dt)
        sprite.x = sprite.x + sprite.speed * sprite.dx
        sprite.y = sprite.y + sprite.speed * sprite.dy
    end

    function sprite.draw()
        love.graphics.setColor(sprite.color)
        love.graphics.rectangle('fill', sprite.x, sprite.y, boss.settings.TILE, boss.settings.TILE)
    end

    return sprite
end

return Sprite
