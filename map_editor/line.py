import pygame
from sprite import Sprite

class Line(pygame.sprite.Sprite):
    def __init__(self, game, sx, sy, ex, ey, qx, qy, c, l):
        pygame.sprite.Sprite.__init__(self, game.lines)
        self.game = game
        w = (ex - sx + 1)*32
        h = (ey - sy + 1)*32
        self.image = pygame.Surface((w, h))
        self.rect = self.image.get_rect()
        self.rect.x = sx*32
        self.rect.y = sy*32
        self.tx = ex - sx + 1
        self.ty = ey - sy + 1
        self.layer = l
        self.get_quad(qx, qy)

    def get_quad(self, qx, qy):
        self.qx, self.qy = qx, qy
        rect = pygame.rect.Rect(qx*32, qy*32, 32, 32)
        for y in range(self.ty):
            for x in range(self.tx):
                self.image.blit(self.game.spritesheet.sheet['decor'], (32*x,32*y), rect)
