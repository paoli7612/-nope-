import pygame

colorkey = (12, 12, 11)

class Sprite(pygame.sprite.Sprite):
    def __init__(self, group, game, x, y, q):
        pygame.sprite.Sprite.__init__(self, group)
        self.game = game
        self.image = pygame.Surface((32, 32))
        self.rect = self.image.get_rect()
        self.pos = (x, y)
        self.rect.topleft = self.pos

    def get_image(self, name, x, y):
            rect = pygame.rect.Rect(x*32*3, y*32*4, 32, 32)
            self.image.blit(self.game.spritesheet.sheet[name], (0,0), rect)
