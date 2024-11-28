player = {}
player.x = 0
player.y = 0
player.speed = 5
player.spriteSheet = love.graphics.newImage('/sprites/player.png')
-- https://opengameart.org/content/zoria-tileset
player.grid = anim8.newGrid(16, 16, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())


-- animations
player.animations = {}
player.animations.down = anim8.newAnimation(player.grid('1-1', 1), 0.2)
player.animations.right = anim8.newAnimation(player.grid('3-3', 1), 0.2)
player.animations.left = anim8.newAnimation(player.grid('3-3', 1), 0.2)
player.animations.up = anim8.newAnimation(player.grid('2-2', 1), 0.2)

player.anim = player.animations.down


return player