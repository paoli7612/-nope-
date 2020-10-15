local Tab = require('interface/tab')

function Chat(boss)
    local s = boss.settings.interface.chat
    local chat = Tab(s)
    local text = ''

    function chat.write(t)
        text = t
    end

    local old_draw = chat.draw
    function chat.draw()
        old_draw()
        if chat.active then
            love.graphics.setColor(0.1, 0, 0.2, 0.4)
            love.graphics.print(text, s.x, s.y + s.h/2, 0, 1.5, 1.5, -s.m, s.m)
        end
    end

    return chat
end

return Chat
