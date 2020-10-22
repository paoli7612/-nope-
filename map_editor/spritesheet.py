import pygame

class Spritesheet:
    def __init__(self, game):
        self.sheet = dict()
        self.sheet['npc'] = pygame.image.load('../src/images/npc.png').convert()
