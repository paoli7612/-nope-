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

        return player
end

return Player
