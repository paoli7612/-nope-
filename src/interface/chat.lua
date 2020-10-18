local Tab = require('interface/tab')

function Chat(boss)
    local s = boss.settings.interface.chat
    local chat = Tab(s)
    local text = {}
    local cur = 1

    function chat.write(t)
        text = t
        cur = 1
        boss.pause = true
    end

    function chat.next()
        cur = cur + 1
        if cur == (#text+1) then
            boss.pause = false
            chat.toggle()
        end
    end

    local old_draw = chat.draw
    function chat.draw()
        old_draw()
        if chat.active then
            love.graphics.setColor(0.1, 0, 0.2, 0.4)
            love.graphics.print(text[cur], s.x, s.y + s.h/2, 0, 1.5, 1.5, -s.m, s.m)
        end
    end

    return chat
end

return Chat
