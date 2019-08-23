import arcade
from proto_ball import Ball
import random
class Game(arcade.Window):
    def __init__(self, width, height, title):
        super().__init__(width, height, title)
        arcade.set_background_color(arcade.color.ASH_GREY)

        self.ball_list = []
        for i in range(0,10): # of balls
            r = random.randint(0, 256)
            g = random.randint(0, 256)
            b = random.randint(0, 256)
            speed = random.randint(0, 50)
            radius = random.randint(0, 50)
            self.ball = Ball(50, 50, speed, speed, radius, (r, g, b), height, width)
            self.ball_list.append(self.ball)

    def on_draw(self):
        arcade.start_render()
        for ball in self.ball_list:
            ball.draw()
        arcade.finish_render()

    def update(self, delta_time):
        for ball in self.ball_list:
            ball.update()
