
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
 world:addCollisionClass("Chest")

  -- modules
  player = require('modules.player')
  walls = require('modules.maps.walls')
  chest = require('modules.chests.chest')


 
end

function love.update(dt)
  local isMoving = false
  local vx = 0
  local vy = 0



  -- movement
  if love.keyboard.isDown('w') then
    vy = -player.speed
    player.dir = "up"
    player.anim = player.animations.up
    isMoving = true
    elseif love.keyboard.isDown('a') then
      vx = -player.speed
     player.dir = "left"
      player.anim = player.animations.left
      isMoving = true
    elseif love.keyboard.isDown('s') then
      vy = player.speed
      player.dir = "down"
      player.anim = player.animations.down
      isMoving = true
    elseif love.keyboard.isDown('d') then
      vx = player.speed
      player.dir = "right"
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


    player.anim:update(dt)



    -- camera
    -- camera resources https://www.youtube.com/watch?v=F3zKl70RJlk
    cam:lookAt(player.x, player.y)

    -- check for width and height of screen
    local w = love.graphics.getWidth() / 2.5
    local h = love.graphics.getHeight() / 2.5

    if cam.x < w/2 then
      cam.x = w/2
    end

    if cam.y < h/2 then
      cam.y = h/2
    end

    local mapW = overworldMap.width * overworldMap.tilewidth
    local mapH = overworldMap.height * overworldMap.tileheight

    -- right border
    if cam.x > (mapW - w/2) then
      cam.x = (mapW - w/2)
    end

    -- bottom border
    if cam.y > (mapH - h/2) then
      cam.y = (mapH - h/2)
    end
    
end

function love.keypressed(key, scancode, isrepeat)
	if key == "f11" then
		fullscreen = not fullscreen
		love.window.setFullscreen(fullscreen, "exclusive")
	end

  if key == 'space' then
    local px, py = player.collider:getPosition()
    if player.dir == "up" then
      local colliders = world:queryCircleArea(px, py, 20, {"Solid"})
      if #colliders > 0 then
        love.event.quit()
      end
    end

  end


end

function love.draw()

  
  cam:attach()
  cam:zoomTo(2.5)
    
      -- game maps
  overworldMap:drawLayer(overworldMap.layers["Ground"])
  overworldMap:drawLayer(overworldMap.layers["Buildings and Terain"])

 player.anim:draw(player.spriteSheet, player.x , player.y, nil, nil, nil, 8, 8) --, 0, 2.5, 2.5
  world:draw()
cam:detach()


end
