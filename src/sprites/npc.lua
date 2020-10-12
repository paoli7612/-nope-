local Sprite = require('sprites/sprite')

function Npc(boss, x, y)
        local npc = Sprite(x, y)
        npc.color = {0,1,0,1}

        local old_update = npc.update
        function npc.update(dt)
            -- ...
            old_update(dt)
        end

        return npc
end

return Npc
