local Boss = require('boss')

function love.load()
    boss = Boss()
end

function love.update(dt)
    boss.update(dt)
end

function love.draw()
    boss.draw()
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
    elseif key == 'y' then
        boss.settings.stats = not boss.settings.stats
    elseif key == 'space' then
        if boss.pause then
            boss.interface.chat.next()
        else
            boss.player.interact()
        end
    elseif key == 'r' then
        print(boss.sprites.show())
        print(boss.maps.spawn.group.show())
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
