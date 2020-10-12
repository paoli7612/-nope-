local Boss = require('boss')
local settings = {
    fullscreen = false,
    fullscreentype = 'exclusive',
    resizable = false,
    borderless = true,
    display = 1 -- only if you have 2 monitors
}

function love.load()
    boss = Boss()
    love.window.setMode(1024, 600, settings)
end

function love.update(dt)
    boss.group.update(dt)
end

function love.draw()
    color = {0.6, 0.6, 0.6}
    love.graphics.setBackgroundColor(color)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("ESC to quit", 10, 10)
    love.graphics.print("P toggle fullscreen", 10, 30)
    love.graphics.print("O change monitor", 10, 50)
    boss.group.draw()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit(0)
    elseif key == 'p' then
        settings.fullscreen = not settings.fullscreen
        love.window.setMode(800, 600, settings)
    elseif key == 'o' then
        settings.display = ((settings.display)%2)+1
        love.window.setMode(800, 600, settings)
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
