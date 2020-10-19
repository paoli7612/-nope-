-- Inrerface
local Interface = require('interface/interface')

-- Sprites
local Group = require('sprites/group')

local Player = require('sprites/player')
local Npc = require('sprites/npc')
local Decor = require('sprites/decor')

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

    boss.group = Group(boss) -- contiene tutti gli sprite

    boss.player = Player(boss, 100, 500)
    boss.group.add(Npc(boss, 700, 200))
    for n=0,1 do
        for i=0,2 do
            boss.group.add(Decor(boss, boss.settings.TILE*i + 400, boss.settings.TILE*n + 400, {i, n+2}))
        end
    end

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
