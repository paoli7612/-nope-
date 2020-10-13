local settings = {
    WIDTH = 1024,
    HEIGHT = 600,
    TILE = 50
}

settings.window = {
    fullscreen = false,
    fullscreentype = 'exclusive',
    resizable = false,
    borderless = true,
    display = 1 -- only if you have 2 monitors
}

settings.interface = {
    WIDTH = settings.WIDTH - 40,
    HEIGHT = 130,
    X = 20,
    Y = settings.HEIGHT - 150
}

return settings
