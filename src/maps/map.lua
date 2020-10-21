function Map(name)
    local map = {}

    local file = require('maps/data'..name..'.lua')
    print(file[1])


    return map
end

return Map
