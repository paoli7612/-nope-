function Interface(boss)
    local interface = {}
    interface.show = false

    function interface.toggle()
        interface.show = not interface.show
        print("toogle")
    end

    function interface.draw()
        if interface.show then
            love.graphics.setColor(1, 1, 1, 1)
            s = boss.settings.interface
            love.graphics.rectangle('fill', s.X, s.Y, s.WIDTH, s.HEIGHT)
        end
    end

    return interface
end

return Interface
