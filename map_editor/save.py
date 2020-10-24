sp = "{c='%s', x=%d, y=%d, q={%d, %d}},"

def save(game):
    # file = open(path.join(self.dir, '../src/maps/data/' + name + '.lua'), 'w')

    for sprite in game.sprites:
        r = sprite.rect
        print(sp % (sprite.className, r.x, r.y, sprite.qx, sprite.qy))

    # file.close()
