from sprite import Sprite
from os import path

def load(game):
    name = game.name
    file = open(path.join(game.path, '../src/maps/data/' + name + '.lua'), 'r')
    cont = file.read()

    for npc in cont.split('-- NPC --')[1].split('\n'):
        npc = npc.strip()
        if not npc:
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

    for decor in cont.split('-- DECOR --')[1].split('\n'):
        decor = decor.strip()
        if not decor:
            continue

        x, y, qx, qy, _ = decor.split(',')
        x = int(x.split('=')[1])
        y = int(y.split('=')[1])
        qx = int(qx.split('{')[1])
        qy = int(qy.split('}')[0])

        Sprite(game, x, y, 'decor', qx, qy)


        print(x, y, qx, qy)

    file.close()
