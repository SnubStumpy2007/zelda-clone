
function love.load()
  -- set window size
  love.window.setMode(1024, 640)

    -- libraries and maps
 anim8 = require 'libraries/anim8'
 sti = require('libraries.sti')
 --camera
 camera = require 'libraries.camera'
 cam = camera()



 --maps
 overworldMap = sti('maps/overworldMap.lua')

 
 -- windfield 
 wf = require('libraries/windfield')
 world = wf.newWorld(0,0, true)
 world:setGravity(0, 0)
 world:addCollisionClass("Solid")
 world:addCollisionClass("Player")

  -- modules
  player = require('modules.player')
  walls = require('modules.maps.walls')


 
end

function love.update(dt)
  local isMoving = false
  local vx = 0
  local vy = 0



  -- movement
  if love.keyboard.isDown('w') then
    vy = -player.speed
    --player.y = player.y - player.speed
    player.anim = player.animations.up
    isMoving = true
    elseif love.keyboard.isDown('a') then
      vx = -player.speed
     -- player.x = player.x - player.speed
      player.anim = player.animations.left
      isMoving = true
    elseif love.keyboard.isDown('s') then
      vy = player.speed
      --player.y = player.y + player.speed
      player.anim = player.animations.down
      isMoving = true
    elseif love.keyboard.isDown('d') then
      vx = player.speed
      --player.x = player.x + player.speed
      player.anim = player.animations.right
      isMoving = true
    end

    player.collider:setLinearVelocity(vx, vy)

    -- set animation to default upon releasing movement keys
    if isMoving == false then
      player.anim:gotoFrame(1)
    end
  
    --press the escape key to exit the game
      if love.keyboard.isDown("escape") then
        love.event.quit()
      end
  
      world:update(dt)
      player.x = player.collider:getX()
      player.y = player.collider:getY()

       -- gamera


    player.anim:update(dt)

    -- camera
    
end

function love.draw()

  cam:attach()

    
      -- game maps
  overworldMap:drawLayer(overworldMap.layers["Ground"])
  overworldMap:drawLayer(overworldMap.layers["Buildings and Terain"])

 player.anim:draw(player.spriteSheet, player.x , player.y) --, 0, 2.5, 2.5
  world:draw()
cam:detach()


end
