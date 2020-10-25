import pygame, time
from os import path
pygame.init()
class Selector(pygame.sprite.Sprite):
    def __init__(self, boss):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.Surface((32, 32))
        self.image.fill((255, 255, 255))
        w = pygame.Surface((28, 28))
        w.fill((25, 25, 25))
        self.image.blit(w, (2, 2))
        self.image.set_colorkey((25, 25, 25))
        self.rect = self.image.get_rect()

    def draw(self, screen):
        screen.blit(self.image, self.rect)

    def update(self):
        x, y = pygame.mouse.get_pos()
        x = x // 32 * 32
        y = y // 32 * 32
        self.rect.topleft =x, y


class Boss:
    def __init__(self):
        self.screen = pygame.display.set_mode((1024, 1024))
        self.path = path.dirname(__file__)
        p = path.join(self.path, '../src/images/decor.png')
        self.image = pygame.image.load(p).convert().convert_alpha()
        #self.screen.blit(self.image, (0,0))
        self.clock = pygame.time.Clock()

        self.selector = Selector(self)

    def event(self):
        for event in pygame.event.get():
            if event.type == pygame.MOUSEBUTTONDOWN:
                print(self.selector.rect.x // 32, self.selector.rect.y // 32)
                self.running = False

    def update(self):
        self.selector.update()

    def draw(self):
        self.screen.blit(self.image, (0,0))
        self.selector.draw(self.screen)
        pygame.display.flip()

    def loop(self):
        self.running = True
        while self.running:
            self.event()
            self.update()
            self.draw()
            self.clock.tick(60)

if __name__ == '__main__':
    b = Boss()
    b.loop()
