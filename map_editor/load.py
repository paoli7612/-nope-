from sprite import Sprite

def load(game, name):
    file = open('../src/maps/data/' + name + '.lua')
    for row in file:
        if (',' in row):
            c, x, y, qx, qy, _ = row.split(',')
            c = c.split('\'')[1]
            x = int(x.split('=')[1])
            y = int(y.split('=')[1])
            qx = int(qx[4:])
            qy = int(qy[:-2])
            Sprite(game, x, y).get_image(c, qx, qy)
