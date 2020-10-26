from sprite import Sprite
from line import Line
from os import path

none = 9

def l_tile(game, tile):
    x, y, qx, qy, l, c = 1, 1, 1, 1, none, none
    for p in tile.split(', '):
        p = p.replace('}','')
        if ('x' in p): x = int(p.split('=')[1])
        elif ('y' in p): y = int(p.split('=')[1])
        elif ('q' in p):
            q = p.split('{')[1]
            qx, qy = list(map(int, q.split(',')))
    Sprite(game, x, y, qx, qy, l, c)


def load(game):
    file = open(path.join(game.path, '../src/maps/data/' + game.name + '.lua'), 'r')
    cont = file.read()

    for npc in cont.split('-- NPC --')[1].split('\n'):
        npc = npc.strip()
        if not npc:
            continue
        x, y, id, _ = npc.split(',')
        x = int(x.split('=')[1])
        y = int(y.split('=')[1])
        Sprite(game, x, y, 5, 5, 2, True)


    for tile in cont.split('-- TILE --')[1].split('\n'):
        tile = tile.strip()
        if not tile:
            continue
        l_tile(game, tile)


    #for tiles in cont.split('-- TILES --')[1].split('\n'):
        #Line(game, sx, sy, ex, ey, qx, qy, 'decor')


    file.close()
