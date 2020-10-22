import pygame
from spritesheet import Spritesheet
from load import load

class Game:
    def __init__(self):
            self.screen = pygame.display.set_mode((1024, 600))
            self.clock = pygame.time.Clock()
            self.spritesheet = Spritesheet(self)
            self.sprites = pygame.sprite.Group()
            self.selected = None
            load(self, 'spawn')

            self.t = [0,0] # trasla freccie

            self.loop()


    def loop(self):
        self.running = True
        while self.running:
            self.event()
            self.update()
            self.draw()
            self.clock.tick(60)

    def event(self):
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                self.running = False
            else:
                if event.type == pygame.MOUSEBUTTONDOWN:
                    if self.selected:
                        self.selected = None
                    else:
                        pos = pygame.sprite.Sprite()
                        pos.rect = pygame.rect.Rect(0, 0, 2, 2)
                        pos.rect.center = pygame.mouse.get_pos()
                        for sprite in self.sprites:
                            if pygame.sprite.collide_rect(sprite, pos):
                                self.selected = sprite
                                self.t = list(sprite.rect.center)
                                break;
                elif event.type == pygame.MOUSEMOTION:
                    if self.selected:
                        self.selected.rect.center = pygame.mouse.get_pos()
                elif event.type == pygame.KEYDOWN:
                    if event.key == pygame.K_UP:
                        self.t[1] -= 1
                    elif event.key == pygame.K_DOWN:
                        self.t[1] += 1
                    elif event.key == pygame.K_LEFT:
                        self.t[0] -= 1
                    elif event.key == pygame.K_RIGHT:
                        self.t[0] += 1
                    self.selected.rect.center = self.t


    def update(self):
        self.sprites.update()

    def draw(self):
        self.screen.fill((255, 255, 255))
        self.sprites.draw(self.screen)
        pygame.display.flip()

if __name__ == '__main__':
    g = Game()
