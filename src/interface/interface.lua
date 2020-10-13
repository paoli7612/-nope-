local Chat = require('interface/chat')

function Interface(boss)
    local interface = {}
    interface.chat = Chat(boss)

    function interface.draw()
        interface.chat.draw()
    end

    return interface
end

return Interface
