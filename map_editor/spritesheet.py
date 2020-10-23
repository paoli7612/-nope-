import pygame
from os import path

class Spritesheet:
    def __init__(self, game):
        self.game = game
        self.sheet = dict()
        self.sheet['npc'] = self.get_sheet('npc')
        self.sheet['decor'] = self.get_sheet('decor')
        self.sheet['wall'] = self.get_sheet('wall')

    def get_sheet(self, name):
        p = path.join(self.game.path, '../src/images/' + name + '.png')
        image = pygame.image.load(p).convert().convert_alpha()
        return image
