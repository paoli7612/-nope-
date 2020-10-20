-- map
local Test = require('map')

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
    boss.spritesheet = {}
    boss.spritesheet.decor = Spritesheet(boss, 'decor')
    boss.spritesheet.npc = Spritesheet(boss, 'npc')

    boss.group = Test(boss)

    boss.player = Player(boss, 100, 500)


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
    end

    return boss
end

return Boss
