local Sprite = require('sprites/sprite')

function Npc(boss, x, y)
        local npc = Sprite(x, y)
        npc.color = {0,1,0,0.8}


        local old_update = npc.update
        function npc.update(dt)
            control_collide()
            old_update(dt)
        end

        function control_collide()
            if (math.abs(npc.x - boss.player.x) < boss.settings.TILE/2) and (math.abs(npc.y - boss.player.y) < boss.settings.TILE/2) then
                return true
            else
                return false
            end
        end

        return npc
end

return Npc
