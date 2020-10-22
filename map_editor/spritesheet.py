import pygame

class Spritesheet:
    def __init__(self, game):
        self.sheet = dict()
        self.sheet['npc'] = self.get_sheet('npc')
        self.sheet['decor'] = self.get_sheet('decor')

    def get_sheet(self, name):
        image = pygame.image.load('../src/images/' + name + '.png').convert()
        image.set_colorkey((0,0,0))
        return image
