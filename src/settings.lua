function Settings(boss)
    local settings = {
        X = 50,
        Y = 30,
        TILE = 32,
        stats = false
    }
    settings.WIDTH = 32*settings.X
    settings.HEIGHT = 32*settings.Y
    print(settings.WIDTH, settings.HEIGHT)
    settings.window = {
        fullscreen = false,
        fullscreentype = 'exclusive',
        resizable = false,
        borderless = true,
        display = 1 -- only if you have 2 monitors
    }
    settings.interface = {
        chat = {
            x = 20,
            y = settings.HEIGHT - 150,
            w = settings.WIDTH - 40,
            h = 130,
            m = 10
        },
        inventory = {
            x = settings.WIDTH - 420,
            y = 20,
            w = 400,
            h = 400,
            m = 10
        }
    }

    function settings.window_update()
        love.window.setMode(settings.WIDTH, settings.HEIGHT, settings.window)
    end
    settings.window_update()
    function settings.pixels(x, y)
        x = x*settings.TILE
        y = y*settings.TILE
        return x, y
    end
    function settings.draw()
        love.graphics.setColor(0, 0, 0)
        love.graphics.print("ESC to quit", 400, 10)
        love.graphics.print("P toggle fullscreen", 400, 30)
        love.graphics.print("O change monitor", 400, 50)
        love.graphics.print("I toggle inventory", 400, 70)
        love.graphics.print("Y toggle stas npc", 400, 110)
    end

    return settings
end

return Settings
