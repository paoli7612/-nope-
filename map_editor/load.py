from sprite import Sprite
from line import Line
from os import path
import random

none = 9

def l_tile(game, tile):
    x, y, qx, qy, l, c = 1, 1, 1, 1, none, none
    for p in tile.split(', '):
        p = p.replace('}','')
        if 'x' in p: x = int(p.split('=')[1])
        elif 'y' in p: y = int(p.split('=')[1])
        elif 'q' in p: qx, qy = list(map(int, p.split('{')[1].split(',')))
    Sprite(game, x, y, qx, qy, c, l)

def l_tiles(game, tiles):
    sx, sy, ex, ey, qx, qy, c, l = 0,0,0,0,0,0, none, none
    for p in tiles[1:].split(', '):
        if '--' in p: continue
        p = p.replace('}', '')
        if 's' in p: sx, sy = list(map(int, p.split('{')[1].split(',')))
        elif 'e' in p: ex, ey = list(map(int, p.split('{')[1].split(',')))
        elif 'q' in p: qx, qy = list(map(int, p.split('{')[1].split(',')))
        elif 'l' in p: l = int(p.split('=')[1])
    Line(game, sx, sy, ex, ey, qx, qy, c, l)

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
        Sprite(game, x, y, 1, random.randint(0, 4), 2, True, 'npc')


    for tile in cont.split('-- TILE --')[1].split('\n'):
        tile = tile.strip()
        if not tile:
            continue
        l_tile(game, tile)


    for tiles in cont.split('-- TILES --')[1].split('\n'):
        tiles = tiles.strip()
        if not tiles:
            continue
        l_tiles(game, tiles)


    file.close()
