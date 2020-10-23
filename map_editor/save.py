def save(game):
    #file = open('../src/maps/data/' + name + '.lua', 'w')

    for sprite in game.sprites:
        r = sprite.rect
        print(r.x, r.y, sprite.className, sprite.qx, sprite.qy)

    #file.close()
