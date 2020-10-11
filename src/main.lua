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

function love.mousepressed(x, y, button)
    print(x, y, button)
end
function love.mousereleased(x, y, button)
end

function love.keypressed(key)
end
function love.keyreleased(key)
end

function love.focus(f)
    -- mouse in in window
    if f then
        print("Focus in")
    else
        print("Focus out")
    end
end

function love.quit()
    print("Thanks for playing! Come back soon!")
end
