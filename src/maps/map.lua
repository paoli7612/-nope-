local Group = require('sprites/group')

function Map(boss, name)
    local map = {}

    local file = require('maps/data/'..name)

    boss.group = Group(boss)

    return map
end

return Map
