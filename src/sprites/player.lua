local Npc = require('sprites/npc')

function Player(boss, x, y)
        local player = Npc(boss, x, y)
        player.color = {1, 0, 0, 0.8} -- Red

        -- UPDATE
        local olt_update = player.update
        function player.update(dt)
            if love.keyboard.isDown('up') then
                player.dy = -1
                player.dir = 'up'
            end
            if love.keyboard.isDown('down') then
                player.dy = 1
                player.dir = 'down'
            end
            if love.keyboard.isDown('left') then
                player.dx = -1
                player.dir = 'left'
            end
            if love.keyboard.isDown('right') then
                player.dx = 1
                player.dir = 'right'
            end
            olt_update(dt)
        end

        function player.interact()
            local x = player.x
            local y = player.y
            local g = boss.settings.TILE
            if player.dir == 'up' then
                y = y - g
            elseif player.dir == 'down' then
                y = y + g
            elseif player.dir == 'left' then
                x = x - g
            elseif player.dir == 'right' then
                x = x + g
            end
            local sprite = boss.group.get(x, y)
            if sprite then
                print(sprite)
            end
        end

        return player
end

return Player
