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
        boss.player.draw()
        for i,sprite in ipairs(group.sprites) do
            sprite.draw()
        end
    end

    return group
end

return Group
