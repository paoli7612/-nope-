local Map = require('maps/map')

function Maps(boss)
    local maps = {}

    maps.spawn = Map(boss, 'spawn')

    return maps
end

return Maps
