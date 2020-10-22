import pygame

colorkey = (12, 12, 11)

class Sprite(pygame.sprite.Sprite):
    def __init__(self, game, x, y):
        pygame.sprite.Sprite.__init__(self, game.sprites)
        self.game = game
        self.image = pygame.Surface((32, 32))
        self.rect = self.image.get_rect()
        self.pos = (x, y)
        self.rect.topleft = self.pos
        self.image.set_colorkey((0,0,0))

    def get_image(self, name, x, y):
            if name == 'npc':
                x = x*3 +1
                y = y*4
            rect = pygame.rect.Rect(x*32, y*32, 32, 32)
            self.image.blit(self.game.spritesheet.sheet[name], (0,0), rect)
