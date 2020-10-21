local settings = {
    WIDTH = 1024,
    HEIGHT = 600,
    TILE = 32,
    stats = false
}

settings.window = {
    fullscreen = false,
    fullscreentype = 'exclusive',
    resizable = false,
    borderless = true,
    display = 1 -- only if you have 2 monitors
}

function settings.window_update()
    love.window.setMode(settings.WIDTH, settings.HEIGHT, settings.window)
end

function settings.draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("ESC to quit", 10, 10)
    love.graphics.print("P toggle fullscreen", 10, 30)
    love.graphics.print("O change monitor", 10, 50)
    love.graphics.print("I toggle inventory", 10, 70)
    love.graphics.print("Y toggle stas npc", 10, 110)
end

settings.interface = {
    chat = {
        x = 20,
        y = settings.HEIGHT - 150,
        w = settings.WIDTH - 40,
        h = 130,
        m = 10,
        key = 'U'
    },
    inventory = {
        x = settings.WIDTH - 420,
        y = 20,
        w = 400,
        h = 400,
        m = 10,
        key = 'I'
    }
}

return settings
