local Deck = require('cards/deck')

function Player(boss, name, x, y)
    local player = {}
    player.name = name
    player.deck = Deck(boss, x, y + 20)

    function player.draw()
        love.graphics.print(player.name, x, y)
        player.deck.draw()
    end

    return player
end

return Player
