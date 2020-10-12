local Sprite = require('sprites/sprite')

function Npc(boss)
        local npc = Sprite(400, 200)

        local old_update = npc.update
        function npc.update(dt)
            old_update(dt)
        end

        return npc
end

return Npc
