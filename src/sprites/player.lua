local Sprite = require('sprites/sprite')

function Player(boss)
        local player = Sprite(100, 100)
        player.dir = "down"
        player.action = "stand"

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
            player.x = player.x + player.speed * player.dx
            player.y = player.y + player.speed * player.dy
        end

        function player.draw()
            boss.spritesheet.draw(player)
        end

        return player
end

return Player
