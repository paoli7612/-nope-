local Sprite = require('sprites/sprite')
local Stats = require('sprites/stats/stats')

function Npc(boss, x, y)
        local npc = Sprite(boss, x, y)
        npc.color = {0,1,0,0.8}
        npc.dir = "down"
        npc.action = "walk"
        npc.frame = 1
        npc.quad = boss.spritesheet.quads_npc(love.math.random(0, 7), love.math.random(0,4))

        npc.stats = Stats(boss)

        local dtotal = 0

        local old_update = npc.update
        function npc.update(dt)
            print(npc.dx, npc.dy)
            dtotal = dtotal + dt
            if dtotal >= 0.1 then
                npc.switch_frame()
                dtotal = 0
            end
            npc.control_collide()
            old_update(dt)
        end

        local old_draw = npc.draw
        function npc.draw()
            -- old_draw()
            boss.spritesheet.draw(npc.x, npc.y, npc.quad[npc.dir][npc.action][npc.frame])
            if boss.settings.stats then
                npc.stats.draw(npc.x, npc.y)
            end
        end

        function npc.control_collide()
            if (math.abs(npc.x - boss.player.x) < boss.settings.TILE/2) and (math.abs(npc.y - boss.player.y) < boss.settings.TILE/2) then
                return true
            else
                return false
            end
        end

        function npc.switch_frame()
            if ((npc.dx == 0) and (npc.dy == 0)) then
                npc.action="stand"
                npc.frame = 1
            else
                npc.action="walk"
                if (npc.frame == 1) then npc.frame = 2
                else npc.frame = 1 end
            end
        end

        return npc
end

return Npc
