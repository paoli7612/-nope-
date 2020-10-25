-- map
local Maps = require('maps/maps')

-- Inrerface
local Interface = require('interface/interface')

-- Sprites
local Player = require('sprites/player')

-- Images
local Spritesheet = require('images/spritesheet')

function Boss()
    local boss = {}
    boss.pause = false
    boss.settings = require('settings')
    boss.interface = Interface(boss)
    boss.spritesheet = Spritesheet(boss, 'decor')
    boss.npc_sheet = Spritesheet(boss, 'npc')
    boss.maps = Maps(boss)

    boss.player = Player(boss, 100, 280)


    function boss.update(dt)
        if not boss.pause then
            boss.player.update(dt)
            boss.group.update(dt)
        end
    end

    function boss.draw()
        boss.group.draw()
        boss.player.draw()
        boss.interface.draw()
        boss.settings.draw()
    end

    return boss
end

return Boss
