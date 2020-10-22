import pygame
from sprite import Sprite

class Game:
    def __init__(self):
            self.screen = pygame.display.set_mode((1024, 600))
            self.clock = pygame.time.Clock()
            self.sprites = pygame.sprite.Group()

            s = Sprite(self.sprites, 10, 10)

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

    def update(self):
        self.sprites.update()

    def draw(self):
        self.sprites.draw(self.screen)
        pygame.display.flip()


if __name__ == '__main__':
    g = Game()
