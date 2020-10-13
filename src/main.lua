local Boss = require('boss')

function love.load()
    boss = Boss()
    love.window.setMode(boss.settings.WIDTH, boss.settings.HEIGHT, boss.settings.window)
end

function love.update(dt)
    boss.update(dt)
end

function love.draw()
    color = {0.6, 0.6, 0.6}
    love.graphics.setBackgroundColor(color)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("ESC to quit", 10, 10)
    love.graphics.print("P toggle fullscreen", 10, 30)
    love.graphics.print("O change monitor", 10, 50)
    love.graphics.print("I toggle interface", 10, 70)
    boss.draw()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit(0)
    elseif key == 'p' then
        boss.settings.window.fullscreen = not boss.settings.fullscreen
        love.window.setMode(800, 600, boss.settings.window)
    elseif key == 'o' then
        boss.settings.window.display = ((boss.settings.window.display)%2)+1
        love.window.setMode(800, 600, boss.settings.window)
    elseif key == 'i' then
        boss.interface.toggle()
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
