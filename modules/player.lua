player = {}
player.x = 0
player.y = 0
player.speed = 5
player.spriteSheet = love.graphics.newImage('/sprites/player.png')
-- https://opengameart.org/content/zoria-tileset
player.grid = anim8.newGrid(16, 16, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())


-- animations
player.animations = {}
player.animations.stand = anim8.newAnimation(player.spriteSheet('1', 1), 0.2 )


player.anim = player.animations.stand

return player