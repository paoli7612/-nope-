function Sprite(boss, x, y)
    local sprite = {}
    sprite.x = x
    sprite.y = y
    sprite.speed = 2
    sprite.dx = 0
    sprite.dy = 0
    sprite.color = {1, 0, 1, 0.8}

    function sprite.update(dt)

        if (not boss.group.collide(sprite)) then
            if (not (sprite.dx == 0) and (not (sprite.dy == 0))) then
                sprite.x = sprite.x + sprite.speed * sprite.dx * 0.6
                sprite.y = sprite.y + sprite.speed * sprite.dy * 0.6
            else
                sprite.x = sprite.x + sprite.speed * sprite.dx
                sprite.y = sprite.y + sprite.speed * sprite.dy
            end
        end
    end

    function sprite.draw()
        love.graphics.setColor(sprite.color)
        love.graphics.rectangle('fill', sprite.x, sprite.y, boss.settings.TILE, boss.settings.TILE)
    end

    function sprite.use()
        print("Hi i'm a sprite")
    end

    return sprite
end

return Sprite
