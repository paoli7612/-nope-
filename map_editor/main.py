import pygame
from spritesheet import Spritesheet
from sprite import Sprite

class Game:
    def __init__(self):
            self.screen = pygame.display.set_mode((1024, 600))
            self.clock = pygame.time.Clock()
            self.spritesheet = Spritesheet(self)
            self.sprites = pygame.sprite.Group()
            Sprite(self.sprites, self, 10, 10, (2, 2)).get_image('npc', 4, 4)

            self.selected = None

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
            print(event)
            if event.type == pygame.QUIT:
                self.running = False
            else:
                if event.type == pygame.MOUSEBUTTONDOWN:
                    if self.selected:
                        pass
                    else:
                        print(pygame.mouse.get_pos())
                        for sprite in self.sprites:
                            pass

    def update(self):
        self.sprites.update()

    def draw(self):
        self.sprites.draw(self.screen)
        pygame.display.flip()


if __name__ == '__main__':
    g = Game()
