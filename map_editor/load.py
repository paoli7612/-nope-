from sprite import Sprite
from os import path

def load(game):
    name = game.name
    file = open(path.join(game.path, '../src/maps/data/' + name + '.lua'), 'r')
    for row in file:
        if (',' in row):
            c, x, y, qx, qy, _ = row.split(',')
            c = c.split('\'')[1]
            x = int(x.split('=')[1])
            y = int(y.split('=')[1])
            qx = int(qx[4:])
            qy = int(qy[:-2])
            Sprite(game, x, y, c, qx, qy)
    file.close()
