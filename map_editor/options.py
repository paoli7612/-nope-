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
        self.n_options = 0

    def write(self, keys, desc):
        self.n_options  += 1

        ks = self.font.render(keys, True, (255, 255, 255))
        kr = ks.get_rect()
        kr.topleft = (20, self.n_options*20 + 40)
        self.image.blit(ks, kr)

        ds = self.font.render(desc, True, (255, 200, 150))
        dr = ds.get_rect()
        dr.topleft = (380, self.n_options*20 + 40)
        self.image.blit(ds, dr)

    def draw(self):
        self.game.screen.blit(self.image, self.rect)

    def update(self):
        self.image.fill((20,20,20))
        text = 'Seleziona uno sprite...'
        if self.selected:
            text = 'Hai selezionato uno sprite'
            picture = pygame.transform.scale(self.selected.image, (96, 96))
            self.image.blit(picture, (1024 - 100 - 48, 100-48))
        self.n_options = 0
        self.write(text, '')
        self.write('[ARROW]','muovi sprite pixel per pixel')
        self.write('[CLICK - Mouse]','seleziona sprite')
        self.write('[SPAZIO] / [CLICK - Mouse]','rilascia sprite')
        self.write('[S]','Salva')
        self.write('[ESCAPE]','Esci')
        if not self.selected:
            self.write('[N]', 'Nuovo sprite')
