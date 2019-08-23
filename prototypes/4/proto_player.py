import arcade, os
class Player(arcade.AnimatedWalkingSprite):
    def __init__(self, position_x, position_y, delta, radius, color, SCREEN_HEIGHT, SCREEN_WIDTH):
        file_path = os.path.dirname(os.path.abspath(__file__))
        os.chdir(file_path)

        self.position_x = position_x
        self.position_y = position_y
        self.delta = delta
        self.radius = radius
        self.color = color

        self.SCREEN_WIDTH = SCREEN_WIDTH
        self.SCREEN_HEIGHT = SCREEN_HEIGHT

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

    # def draw(self):
    #     arcade.draw_circle_filled(self.position_x, self.position_y, self.radius, self.color)

    def update(self, direction):
        if direction == 'up':
            self.position_y += self.delta
        elif direction == 'down':
            self.position_y -= self.delta
        elif direction == 'left':
            self.position_x -= self.delta
        elif direction == 'right':
            self.position_x += self.delta
