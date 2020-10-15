local Boss = require('boss')

function love.load()
    boss = Boss()
    boss.settings.window_update()
end

function love.update(dt)
    boss.update(dt)
end

function love.draw()
    boss.draw()
    color = {0.6, 0.6, 0.6}
    love.graphics.setBackgroundColor(color)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("ESC to quit", 10, 10)
    love.graphics.print("P toggle fullscreen", 10, 30)
    love.graphics.print("O change monitor", 10, 50)
    love.graphics.print("I toggle inventory", 10, 70)
    love.graphics.print("U toggle chat", 10, 90)
    love.graphics.print("Y toggle stas npc", 10, 110)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit(0)
    elseif key == 'p' then
        boss.settings.window.fullscreen = not boss.settings.window.fullscreen
        boss.settings.window_update()
    elseif key == 'o' then
        if boss.settings.window.display == 1 then boss.settings.window.display = 2
        else boss.settings.window.display = 1 end
        boss.settings.window_update()
    elseif key == 'i' then
        boss.interface.inventory.toggle()
    elseif key == 'u' then
        boss.interface.chat.toggle()
        boss.interface.chat.write('Abbiamo tutti il diritto, a una certa ora, di sentirci bene, un altra persona')
    elseif key == 'y' then
        boss.settings.stats = not boss.settings.stats
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
