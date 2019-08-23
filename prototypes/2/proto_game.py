import arcade
from proto_player import Player
class Game(arcade.Window):
    Left = False
    Right = False
    Up = False
    Down = False

    def __init__(self, width, height, title):
        super().__init__(width, height, title)
        arcade.set_background_color(arcade.color.ASH_GREY)
        self.player = Player(50, 50, 5, 30, arcade.color.BLUE, self.height, self.width)

    def on_draw(self):
        arcade.start_render()
        self.player.draw()
        arcade.finish_render()

    def on_key_press(self, key, modifiers):
        if key == arcade.key.LEFT:
            self.Left = True
        elif key == arcade.key.RIGHT:
            self.Right = True
        elif key == arcade.key.UP:
            self.Up = True
        elif key == arcade.key.DOWN:
            self.Down = True

    def on_key_release(self, key, modifiers):
        if key == arcade.key.LEFT:
            self.Left = False
        elif key == arcade.key.RIGHT:
            self.Right = False
        elif key == arcade.key.UP:
            self.Up = False
        elif key == arcade.key.DOWN:
            self.Down = False

    def update(self, delta_time):

        if self.Right:
            self.player.update('right')
        elif self.Left:
            self.player.update('left')
        elif self.Up:
            self.player.update('up')
        elif self.Down:
            self.player.update('down')
