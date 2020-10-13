local Chat = require('interface/chat')
local Inventory = require('interface/inventory')

function Interface(boss)
    local interface = {}
    interface.chat = Chat(boss)
    interface.inventory = Inventory(boss)

    function interface.draw()
        interface.chat.draw()
        interface.inventory.draw()
    end

    return interface
end

return Interface
