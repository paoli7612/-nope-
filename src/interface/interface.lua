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
            love.graphics.setColor(0.2, 0.2, 0.2, 1)
            love.graphics.print('MA ASDD', s.TX, s.TY, 0, 2)
        end
    end

    return interface
end

return Interface
