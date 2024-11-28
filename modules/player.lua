player = {}
player.x = 0
player.y = 0
player.speed = 5
player.sprite = love.graphics.newImage('/sprites/player.png')
-- https://opengameart.org/content/zoria-tileset
 player.spritSheet = anim8.newGrid(97, 16, player.sprite:getWidth(), player.sprite:getHeight())


-- -- animations
-- player.animations = {}
-- player.animations.stand = anim8.newAnimation(player.spriteSheet('1', 1), 0.2 )


-- player.anim = player.animations.stand

return player