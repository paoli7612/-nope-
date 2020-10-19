function Group(boss)
    local group = {}
    group.sprites = {}

    function group.add(sprite)
        table.insert(group.sprites, sprite)
    end

    function group.update(dt)
        for i,sprite in ipairs(group.sprites) do
            sprite.update(dt)
        end
    end

    function group.draw()
        for i,sprite in ipairs(group.sprites) do
            sprite.draw()
        end
    end

    function group.collide(sprite)
        local x = sprite.x + sprite.dx*sprite.speed*2
        local y = sprite.y + sprite.dy*sprite.speed*2
        for i,other in ipairs(group.sprites) do
            if (math.abs(other.y - y) < 30) and (math.abs(other.x - x) < 20) then
                return true
            end
        end
    end

    -- Restituisce se presente lo sprite che sta a queste coordinate
    function group.get(x, y)
        for i,sprite in ipairs(group.sprites) do
            if (math.abs(sprite.y - y) < 30) and (math.abs(sprite.x - x) < 20) then
                return sprite
            end
        end
    end


    return group
end

return Group
