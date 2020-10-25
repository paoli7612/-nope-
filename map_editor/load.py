from sprite import Sprite
from os import path

def load(game):
    name = game.name
    file = open(path.join(game.path, '../src/maps/data/' + name + '.lua'), 'r')
    cont = file.read()

    for npc in cont.split('-- NPC --')[1].split('\n'):
        if not npc.strip():
            continue
        x, y, id, _ = npc.split(',')
        x = int(x.split('=')[1])
        y = int(y.split('=')[1])
        Sprite(game, x, y, 'npc', 2, 2)
    for wall in cont.split('-- WALL --')[1].split('\n'):
        wall = wall.strip()
        if not wall:
            continue
        s, e, q, _, __ = wall.split('}')

        s = s.split('{')[2].split(',')
        e = e.split('{')[1].split(',')
        q = q.split('{')[1].split(',')

        sx = int(s[0])
        sy = int(s[1])
        ex = int(e[0])
        ey = int(e[1])
        qx = int(q[0])
        qy = int(q[1])

        print(sx, sy, ex, ey)
        for y in range(sy, ey+1):
            for x in range(sx, ex+1):
                Sprite(game, x*32, y*32, 'decor', qx, qy)

    wall = cont.split('-- WALL --')[1]
    decor = cont.split('-- DECOR --')[1]


    file.close()
