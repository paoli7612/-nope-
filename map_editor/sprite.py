import pygame

class Sprite(pygame.sprite.Sprite):
    def __init__(self, group, x, y):
        pygame.sprite.Sprite.__init__(self, group)
        self.image = pygame.Surface((32, 32))
        self.image.fill((30, 30, 30))
        self.rect = self.image.get_rect()
        self.rect.topleft = (x, y)
