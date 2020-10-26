local Map = require('maps/map')

function Maps(boss)
    local maps = {}

    maps.spawn = Map(boss, 'spawn')
    maps.spawn.load()
    return maps
end

return Maps
