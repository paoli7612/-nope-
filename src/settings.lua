local settings = {
    WIDTH = 1024,
    HEIGHT = 600,
    TILE = 32
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
