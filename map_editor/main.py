import pygame
from spritesheet import Spritesheet
from sprite import Sprite

class Game:
    def __init__(self):
            self.screen = pygame.display.set_mode((1024, 600))
            self.clock = pygame.time.Clock()
            self.spritesheet = Spritesheet(self)
            self.sprites = pygame.sprite.Group()
            Sprite(self.sprites, self, 640, 320, (2, 2)).get_image('npc', 4, 4)
            Sprite(self.sprites, self, 320, 320, (2, 2)).get_image('decor', 4, 4)

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
                                break;

    def update(self):
        self.sprites.update()
        if self.selected:
            self.selected.rect.center = pygame.mouse.get_pos()

    def draw(self):
        self.screen.fill((255, 255, 255))
        self.sprites.draw(self.screen)
        pygame.display.flip()


if __name__ == '__main__':
    g = Game()
