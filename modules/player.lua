player = {}
player.x = 207
player.y = 160
player.speed = 190
player.spriteSheet = love.graphics.newImage('/sprites/player.png')
-- https://opengameart.org/content/zoria-tileset
player.grid = anim8.newGrid(16, 16, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())
player.collider = world:newBSGRectangleCollider(207, 160, 16, 16, 10) -- 430
player.collider:setFixedRotation(true)
player.collider:setCollisionClass("Player")


-- animations
player.animations = {}
player.animations.down = anim8.newAnimation(player.grid('1-1', 1), 0.2)
player.animations.right = anim8.newAnimation(player.grid('3-3', 1), 0.2)
player.animations.left = anim8.newAnimation(player.grid('3-3', 1), 0.2):flipH()
player.animations.up = anim8.newAnimation(player.grid('2-2', 1), 0.2)

player.anim = player.animations.down


return player