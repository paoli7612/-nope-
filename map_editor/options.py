import pygame

class Options:
    def __init__(self, game):
        self.game = game
        self.image = pygame.Surface((960, 200))
        self.rect = self.image.get_rect()
        self.rect.topleft =(0, 480)
        self.font_name = pygame.font.match_font('monospace')
        self.font = pygame.font.Font(self.font_name, 21)
        self.selected = None
        self.n_options = 0

    def write(self, text, x, y, color):
        if text == 9: text = 'decor'
        s = self.font.render(text, True, color)
        r = s.get_rect()
        r.topleft = (x, y)
        self.image.blit(s, r)

    def write_key(self, keys, desc):
        self.n_options  += 1
        self.write(keys, 20, self.n_options*20, (255, 255, 255))
        self.write(desc, 480, self.n_options*20, (255, 200, 150))

    def draw(self):
        self.game.screen.blit(self.image, self.rect)

    def update(self):
        self.image.fill((20,20,20))
        text = 'Seleziona uno sprite...'
        if self.selected:
            text = 'Hai selezionato uno sprite'
            picture = pygame.transform.scale(self.selected.image, (96, 96))
            self.image.blit(picture, (876, 52), (0, 0, 32, 32))
            self.write(self.selected.className, 800, 150, (100, 100, 255))
            self.write(str(self.selected.qx) + " " + str(self.selected.qy) , 880, 150, (100, 100, 255))
        self.n_options = 0
        self.write_key(text, '')
        self.write_key('[ARROW]','muovi sprite pixel per pixel')
        self.write_key('[CLICK - Mouse]','seleziona sprite')
        self.write_key('[SPAZIO] / [CLICK - Mouse]','rilascia sprite')
        self.write_key('[P]','Salva')
        self.write_key('[ESCAPE]','Esci')
        if not self.selected:
            self.write_key('[N]', 'Nuovo sprite')
        else:
            self.write_key('[WASD]', 'Cambia quad')
            self.write_key('[Q]', 'Cambia classe')
