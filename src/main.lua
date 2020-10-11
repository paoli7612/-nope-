local Boss = require('boss')

function love.load()
    boss = Boss()
end

function love.update(dt)
    boss.player.update()
end

function love.draw()
    boss.player.draw()
end

function love.keypressed(key) end
function love.mousepressed(x, y, button) end
function love.mousereleased(x, y, button) end
function love.focus(f) end
function love.quit() end
function love.keyreleased(key)
    if key == 'up' then boss.player.dy = 0 end
    if key == 'down' then boss.player.dy = 0 end
    if key == 'left' then boss.player.dx = 0 end
    if key == 'right' then boss.player.dx = 0 end
end
