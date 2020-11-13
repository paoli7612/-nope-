function Card(boss)
    local card = {}

    function card.draw(x, y)
        love.graphics.setColor(1, 1, 0, 1)
        love.graphics.rectangle('line', x, y, boss.C_W, boss.C_H)
    end

    return card
end

return Card
