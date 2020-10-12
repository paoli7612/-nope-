function Sprite(x, y)
    local sprite = {}
    sprite.x = x
    sprite.y = y
    sprite.speed = 4
    sprite.dx = 0
    sprite.dy = 0
    sprite.color = {1, 0, 1, 0.8}

    function sprite.update(dt)
        sprite.x = sprite.x + sprite.speed * sprite.dx
        sprite.y = sprite.y + sprite.speed * sprite.dy
    end

    function sprite.draw()
        love.graphics.setColor(sprite.color)
        love.graphics.rectangle('fill', sprite.x, sprite.y, 25, 25)
    end

    function sprite.collide_with(other)
        if (math.abs(other.x - sprite.x) < 25) and (math.abs(other.y - sprite.y) < 25) then
            return true
        else
            return false
        end
    end

    return sprite
end

return Sprite
