import pygame

class Options:
    def __init__(self, game):
        self.game = game
        self.image = pygame.Surface((1024, 200))
        self.rect = self.image.get_rect()
        self.rect.topleft =(0, 600)
        self.font_name = pygame.font.match_font('monospace')
        self.font = pygame.font.Font(self.font_name, 21)
        self.selected = None

    def write(self, text, x, y):
        surface = self.font.render(text, True, (255, 200, 200))
        rect = surface.get_rect()
        rect.topleft = (x,y)
        self.image.blit(surface, rect)

    def draw(self):
        self.game.screen.blit(self.image, self.rect)

    def update(self):
        self.image.fill((20,20,20))
        text = 'Seleziona uno sprite...'
        if self.selected:
            text = 'Hai selezionato uno sprite'
            self.image.blit(self.selected.image, (370, 15))
        self.write(text, 20, 20)
        self.write('[ARROW]                           muovi sprite pixel per pixel', 20, 40)
        self.write('[CLICK - Mouse]                   seleziona sprite', 20, 60)
        self.write('[SPAZIO] / [CLICK - Mouse]        rilascia sprite', 20, 80)
        self.write('[S]                               Salva', 20, 100)
        self.write('[ESCAPE]                          Esci', 20, 120)
