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
    if key == 'q' then
        boss.p1.deck.show()
    end
end
function love.keyreleased(key) end
function love.mousepressed(x, y, button)
    if (button == 1) then
        boss.click(x, y)
    end
end
function love.mousereleased(x, y, button) end
function love.focus(f) end
function love.quit() end
