"""
Move with a Sprite Animation

Simple program to show basic sprite usage.

Artwork from http://kenney.nl

If Python and Arcade are installed, this example can be run from the command line with:
python -m arcade.examples.sprite_move_animation
"""
import arcade
import random
import os

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
SCREEN_TITLE = "Move with a Sprite Animation Example"

COIN_SCALE = 0.5
COIN_COUNT = 50

MOVEMENT_SPEED = 5


class MyGame(arcade.Window):
    """ Main application class. """

    def __init__(self, width, height, title):
        """
        Initializer
        """
        super().__init__(width, height, title)

        # Set the working directory (where we expect to find files) to the same
        # directory this .py file is in. You can leave this out of your own
        # code, but it is needed to easily run the examples using "python -m"
        # as mentioned at the top of this program.
        file_path = os.path.dirname(os.path.abspath(__file__))
        os.chdir(file_path)

        """ Set up the game and initialize the variables. """

        # Sprite lists
        self.player_list = None

        # Set up the player
        self.player = None

    def setup(self):
        self.player_list = arcade.SpriteList()

        # Set up the player
            self.player = arcade.AnimatedWalkingSprite()

            character_scale = 0.75
            self.player.stand_right_textures = []
            self.player.stand_right_textures.append(arcade.load_texture("./player/playerRight.png",
                                                                        scale=character_scale))
            self.player.stand_left_textures = []
            self.player.stand_left_textures.append(arcade.load_texture("./player/playerLeft.png",
                                                                       scale=character_scale, mirrored=False))
            self.player.walk_right_textures = []
            self.player.walk_right_textures.append(arcade.load_texture("./player/playerRight_a.png",
                                                                       scale=character_scale))
            self.player.walk_right_textures.append(arcade.load_texture("./player/playerRight_b.png",
                                                                       scale=character_scale))

            self.player.walk_left_textures = []
            self.player.walk_left_textures.append(arcade.load_texture("./player/playerLeft_a.png",
                                                                      scale=character_scale, mirrored=False))
            self.player.walk_left_textures.append(arcade.load_texture("./player/playerLeft_b.png",
                                                                      scale=character_scale, mirrored=False))

            self.player.stand_up_textures = []
            self.player.stand_up_textures.append(arcade.load_texture("./player/playerUp.png",
                                                                        scale=character_scale))
            self.player.stand_down_textures = []
            self.player.stand_down_textures.append(arcade.load_texture("./player/playerDown.png",
                                                                       scale=character_scale, mirrored=False))
            self.player.walk_up_textures = []
            self.player.walk_up_textures.append(arcade.load_texture("./player/playerUp_a.png",
                                                                       scale=character_scale))
            self.player.walk_up_textures.append(arcade.load_texture("./player/playerUp_b.png",
                                                                       scale=character_scale))

            self.player.walk_down_textures = []
            self.player.walk_down_textures.append(arcade.load_texture("./player/playerDown_a.png",
                                                                      scale=character_scale, mirrored=False))
            self.player.walk_down_textures.append(arcade.load_texture("./player/playerDown_b.png",
                                                                      scale=character_scale, mirrored=False))


            self.player.texture_change_distance = 20

            self.player.center_x = SCREEN_WIDTH // 2
            self.player.center_y = SCREEN_HEIGHT // 2
            self.player.scale = 3.0

        self.player_list.append(self.player)

        # Set the background color
        arcade.set_background_color(arcade.color.AMAZON)

    def on_draw(self):
        """
        Render the screen.
        """

        # This command has to happen before we start drawing
        arcade.start_render()

        # Draw all the sprites.
        self.player_list.draw()

    def on_key_press(self, key, modifiers):
        """
        Called whenever a key is pressed.
        """
        if key == arcade.key.UP:
            self.player.change_y = MOVEMENT_SPEED
        elif key == arcade.key.DOWN:
            self.player.change_y = -MOVEMENT_SPEED
        elif key == arcade.key.LEFT:
            self.player.change_x = -MOVEMENT_SPEED
        elif key == arcade.key.RIGHT:
            self.player.change_x = MOVEMENT_SPEED

    def on_key_release(self, key, modifiers):
        """
        Called when the user releases a key.
        """
        if key == arcade.key.UP or key == arcade.key.DOWN:
            self.player.change_y = 0
        elif key == arcade.key.LEFT or key == arcade.key.RIGHT:
            self.player.change_x = 0

    def update(self, delta_time):
        """ Movement and game logic """
        self.player_list.update()
        self.player_list.update_animation()

        # # Generate a list of all sprites that collided with the player.
        # hit_list = arcade.check_for_collision_with_list(self.player, self.coin_list)
        #
        # # Loop through each colliding sprite, remove it, and add to the score.
        # for coin in hit_list:
        #     coin.remove_from_sprite_lists()
        #     self.score += 1


""" Main method """
window = MyGame(SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_TITLE)
window.setup()
arcade.run()
