import arcade
class Player:
    def __init__(self, position_x, position_y, delta, radius, color, SCREEN_HEIGHT, SCREEN_WIDTH):
        self.position_x = position_x
        self.position_y = position_y
        self.delta = delta
        self.radius = radius
        self.color = color

        self.SCREEN_WIDTH = SCREEN_WIDTH
        self.SCREEN_HEIGHT = SCREEN_HEIGHT

    def draw(self):
        arcade.draw_circle_filled(self.position_x, self.position_y, self.radius, self.color)

    def update(self, direction):
        if direction == 'up':
            self.position_y += self.delta
        elif direction == 'down':
            self.position_y -= self.delta
        elif direction == 'left':
            self.position_x -= self.delta
        elif direction == 'right':
            self.position_x += self.delta
