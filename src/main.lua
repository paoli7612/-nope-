local Boss = require('boss')

function love.load()
    boss = Boss()
    love.window.setMode(800, 600, {fullscreen=true})
end

function love.update(dt)
    boss.player.update()
end

function love.draw()
    love.graphics.print("ESC to quit", 10, 10)
    boss.player.draw()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit(0)
    end
end
function love.keyreleased(key)
    if key == 'up' then boss.player.dy = 0 end
    if key == 'down' then boss.player.dy = 0 end
    if key == 'left' then boss.player.dx = 0 end
    if key == 'right' then boss.player.dx = 0 end
end

function love.mousepressed(x, y, button) end
function love.mousereleased(x, y, button) end
function love.focus(f) end
function love.quit() end
