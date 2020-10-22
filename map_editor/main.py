import pygame

class Game:
    def __init__(self):
            self.window = pygame.display.set_mode((400, 400))
            self.clock = pygame.time.Clock()
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
        pass

    def draw(self):
        pass


if __name__ == '__main__':
    g = Game()
