import pygame

colorkey = (12, 12, 11)

class Sprite(pygame.sprite.Sprite):
    def __init__(self, game, x, y, qx, qy, c, l, className = 'decor'):
        pygame.sprite.Sprite.__init__(self, game.sprites)
        self.game = game
        self.image = pygame.Surface((32, 32))
        self.rect = self.image.get_rect()
        self.pos = (x, y)
        self.rect.topleft = x*32, y*32
        self.image.set_colorkey((0,0,0))
        self._layer = l
        self.className = className
        if className == 'npc':
            print(qx, qy)
            self.set_quad(qx*3+1, qy*4)
        else: self.set_quad(qx, qy)

    def set_quad(self, qx, qy):
        self.qx, self.qy = qx, qy
        rect = pygame.rect.Rect(qx*32, qy*32, 32, 32)
        self.image.blit(self.game.spritesheet.sheet[self.className], (0,0), rect)

    def switch_class(self):
        if self.className == 'npc':
            self.className = 'decor'
        elif self.className == 'decor':
            self.className = 'wall'
        else:
            self.className = 'npc'
        self.set_quad(0, 0)
