local Card = require('cards/card')

function Deck(boss, x, y)
    local deck = {}

    deck.cards = {}
    table.insert(deck.cards, Card(boss))
    table.insert(deck.cards, Card(boss))
    table.insert(deck.cards, Card(boss))
    table.insert(deck.cards, Card(boss))
    table.insert(deck.cards, Card(boss))

    function deck.show()
        for i,v in ipairs(deck.cards) do
            print(i, v)
        end
    end

    function deck.draw()
        local px = x
        for i,v in ipairs(deck.cards) do
            v.draw(px, y)
            px = px+boss.C_W+ boss.C_M
        end
    end

    function deck.get(x, y)

    end

    return deck
end

return Deck
