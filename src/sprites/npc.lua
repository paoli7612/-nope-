local Sprite = require('sprites/sprite')

function Npc(boss, x, y)
        local npc = Sprite(x, y)
        npc.color = {0,1,0,0.8}

        local old_update = npc.update
        function npc.update(dt)
            -- ...
            old_update(dt)
        end

        function npc.collide()
            if (math.abs(sprite.x - boss.player.x) < boss.options.TILE/2) and (math.abs(sprite.y - boss.player.y) < boss.options.TILE/2) then
                return true
            else
                return false
            end
        end

        return npc
end

return Npc
