import pygame
from spritesheet import Spritesheet
from load import load
from save import save
from options import Options
from sprite import Sprite
from os import path

pygame.init()

class Game:
    def __init__(self, name):
        pygame.display.set_caption('Modena editor: ' + name)
        self.path = path.dirname(__file__)
        self.name = name
        self.options = Options(self)
        self.screen = pygame.display.set_mode((960, 480 + self.options.rect.h))
        self.clock = pygame.time.Clock()
        self.spritesheet = Spritesheet(self)
        self.sprites = pygame.sprite.Group()
        self.lines = pygame.sprite.Group()
        self.options.selected = None

        load(self)
        self.t = None # trasla freccie
        self.loop()

    def loop(self):
        self.running = True
        while self.running:
            self.event()
            self.update()
            self.draw()
            self.clock.tick(60)

    def keydown(self, key):
            if key == pygame.K_ESCAPE:
                self.running = False
            elif key == pygame.K_p:
                save(self)
            elif self.options.selected:
                qx, qy = self.options.selected.qx, self.options.selected.qy
                if key == pygame.K_SPACE:
                    self.options.selected = None
                    pygame.mouse.set_visible(True)
                    return
                elif key == pygame.K_q:
                    self.options.selected.switch_class()
                elif key == pygame.K_w: self.options.selected.set_quad(qx, qy-1)
                elif key == pygame.K_s: self.options.selected.set_quad(qx, qy+1)
                elif key == pygame.K_a: self.options.selected.set_quad(qx-1, qy)
                elif key == pygame.K_d: self.options.selected.set_quad(qx+1, qy)

                elif key == pygame.K_UP: self.t[1] -= 1
                elif key == pygame.K_DOWN:  self.t[1] += 1
                elif key == pygame.K_LEFT: self.t[0] -= 1
                elif key == pygame.K_RIGHT: self.t[0] += 1
                self.options.selected.rect.center = self.t

            elif key == pygame.K_n:
                self.options.selected = Sprite(self, 1024/2, 300, 'decor', 0,0)

    def event(self):
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                self.running = False
            else:
                if event.type == pygame.MOUSEBUTTONDOWN:
                    if self.options.selected:
                        self.options.selected = None
                        pygame.mouse.set_visible(True)
                    else:
                        pos = pygame.sprite.Sprite()
                        pos.rect = pygame.rect.Rect(0, 0, 2, 2)
                        pos.rect.center = pygame.mouse.get_pos()
                        def gin(group):
                            for sprite in group:
                                if pygame.sprite.collide_rect(sprite, pos):
                                    self.options.selected = sprite
                                    self.t = list(sprite.rect.center)
                                    pygame.mouse.set_visible(False)
                                    break;
                        gin(self.sprites)
                        gin(self.lines)
                elif event.type == pygame.MOUSEMOTION:
                    if self.options.selected:
                        self.options.selected.rect.center = pygame.mouse.get_pos()
                        self.t = list(pygame.mouse.get_pos())
                elif event.type == pygame.KEYDOWN:
                    self.keydown(event.key)

    def update(self):
        self.sprites.update()
        self.lines.update()
        self.options.update()

    def draw(self):
        self.screen.fill((240, 240, 240))
        self.options.draw()
        self.lines.draw(self.screen)
        self.sprites.draw(self.screen)
        pygame.display.flip()

if __name__ == '__main__':
    g = Game('spawn')
