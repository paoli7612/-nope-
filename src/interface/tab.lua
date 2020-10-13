function Tab(s)
    local tab = {}
    tab.active = false

    function tab.draw()
        if tab.active then
            love.graphics.setColor(1, 1, 1, 0.6)
            love.graphics.rectangle('fill', s.x, s.y, s.w, s.h)
            love.graphics.setColor(0, 0, 0, 0.8)
            love.graphics.print(s.key, s.x + s.w - (s.m * 3), s.y + s.m, 0, 2)
        end
    end

    function tab.toggle()
        tab.active = not tab.active
    end

    return tab
end

return Tab
