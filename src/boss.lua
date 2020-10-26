local Player = require('sprites/player') -- Giocatore
local Maps = require('maps/maps') -- Mappe
local Interface = require('interface/interface') -- Interfacce
local Spritesheet = require('images/spritesheet') -- Spritesheet
local Settings = require('settings')

function Boss()
    local boss = {}
    boss.settings = Settings(boss)
    print(boss.settings.interface.chat)
    boss.interface = Interface(boss)
    boss.spritesheet = Spritesheet(boss, 'decor')
    boss.npc_sheet = Spritesheet(boss, 'npc')
    boss.maps = Maps(boss)

    boss.player = Player(boss, 100, 280)

    boss.pause = false

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
