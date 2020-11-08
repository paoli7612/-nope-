import pygame
from os import path

class Spritesheet:
    def __init__(self, game):
        self.game = game
        self.sheet = dict()
        self.sheet['npc'] = self.get_sheet('npc')
        self.sheet['decor'] = self.get_sheet('decor')

    def get_sheet(self, name):
        p = path.join(self.game.path, '../src/images/' + name + '.png')
        image = pygame.image.load(p).convert_alpha()
        image.set_colorkey((0,0,0))
        return image

    def get(self, className, qx, qy):
        im = pygame.Surface((32, 32))
        im.fill((23, 23, 22))
        rect = pygame.rect.Rect(qx*32, qy*32, 32, 32)
        im.blit(self.sheet[className], (0,0), rect)
        im.set_colorkey((23, 23, 22))
        return im
