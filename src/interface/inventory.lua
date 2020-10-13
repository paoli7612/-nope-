local Tab = require('interface/tab')

function Inventory(boss)
    local s = boss.settings.interface.inventory
    local inventory = Tab(s)
    local text = ''

    function inventory.write(t)
        text = t
    end

    local old_draw = inventory.draw
    function inventory.draw()
        old_draw()
        if inventory.active then
            love.graphics.setColor(0.1, 0, 0.2, 0.4)
            love.graphics.print(text, s.x + s.m, s.y + s.m, 0, 1.5)
        end
    end

    return inventory
end

return Inventory
