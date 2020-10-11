local Sprite = require('sprites/sprite')

function Player()
        local player = Sprite(100, 100)

        function player.update(dt)
            if love.keyboard.isDown('up') then player.dy = -1 end
            if love.keyboard.isDown('down') then player.dy = 1 end
            if love.keyboard.isDown('left') then player.dx = -1 end
            if love.keyboard.isDown('right') then player.dx = 1 end
            player.x = player.x + player.speed * player.dx
            player.y = player.y + player.speed * player.dy
        end
        return player
end

return Player
