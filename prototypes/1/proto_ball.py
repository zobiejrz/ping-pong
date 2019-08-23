import arcade
class Ball:
    def __init__(self, position_x, position_y, delta_x, delta_y, radius, color, SCREEN_HEIGHT, SCREEN_WIDTH):
        self.position_x = position_x
        self.position_y = position_y
        self.delta_x = delta_x
        self.delta_y = delta_y
        self.radius = radius
        self.color = color

        self.SCREEN_WIDTH = SCREEN_WIDTH
        self.SCREEN_HEIGHT = SCREEN_HEIGHT

    def draw(self):
        arcade.draw_circle_filled(self.position_x, self.position_y, self.radius, self.color)

    def update(self):
        self.position_x += self.delta_x
        self.position_y += self.delta_y

        if self.position_x < self.radius:
            self.delta_x *= -1

        if self.position_x > self.SCREEN_WIDTH - self.radius:
            self.delta_x *= -1

        if self.position_y < self.radius:
            self.delta_y *= -1

        if self.position_y > self.SCREEN_HEIGHT - self.radius:
            self.delta_y *= -1
