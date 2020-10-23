import pygame

colorkey = (12, 12, 11)

class Sprite(pygame.sprite.Sprite):
    def __init__(self, game, x, y, className, qx, qy):
        self.className = className
        self.qx, self.qy = qx, qy
        pygame.sprite.Sprite.__init__(self, game.sprites)
        self.game = game
        self.image = pygame.Surface((32, 32))
        self.rect = self.image.get_rect()
        self.pos = (x, y)
        self.rect.topleft = self.pos
        self.image.set_colorkey((0,0,0))
        if className == 'npc':
            qx = qx*3 +1
            qy = qy*4
        rect = pygame.rect.Rect(qx*32, qy*32, 32, 32)
        self.image.blit(self.game.spritesheet.sheet[className], (0,0), rect)
