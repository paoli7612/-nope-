function Tab(s)
    local tab = {}
    tab.active = false

    function tab.draw()
        if tab.active then
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.rectangle('fill', s.x, s.y, s.w, s.h)
        end
    end

    function tab.toggle()
        tab.active = not tab.active
    end

    return tab
end

return Tab
