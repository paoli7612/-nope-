function Group(boss)
    local group = {}
    group.sprites = {}
    group.inconsistent = {}

    function group.add(sprite, collider)
        if collider then
            table.insert(group.sprites, sprite)
        else
            table.insert(group.inconsistent, sprite)
        end
    end

    function group.update(dt)
        for i,sprite in ipairs(group.sprites) do
            sprite.update(dt)
        end
    end

    function draw(g, l)
        for i, s in ipairs(g) do
            if l == s.layer then
                s.draw()
            end
        end
    end

    function group.draw()
        draw(group.inconsistent, 0)
        draw(group.inconsistent, 1)
        boss.player.draw()
        draw(group.inconsistent, 2)
        draw(group.sprites, 0)
        draw(group.sprites, 1)
        draw(group.sprites, 2)
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
