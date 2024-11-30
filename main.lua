
function love.load()
  -- set window size
  love.window.setMode(1024, 640)

    -- libraries and maps
 anim8 = require 'libraries/anim8'
 gameMap = require('libraries.sti')

 
 -- windfield 
 wf = require('libraries/windfield')
 world = wf.newWorld(0,0, true)
 world:setGravity(0, 0)
 world:addCollisionClass("Solid")
 world:addCollisionClass("Player")

  -- modules
  player = require('modules.player')
  walls = require('modules.walls')


 
end

function love.update(dt)
  -- movement
  if love.keyboard.isDown('w') then
    player.y = player.y - player.speed
    player.anim = player.animations.up
    elseif love.keyboard.isDown('a') then
      player.x = player.x - player.speed
      player.anim = player.animations.left
    elseif love.keyboard.isDown('s') then
      player.y = player.y + player.speed
      player.anim = player.animations.down
    elseif love.keyboard.isDown('d') then
      player.x = player.x + player.speed
      player.anim = player.animations.right
    end

    player.anim:update(dt)
end

function love.draw()

 player.anim:draw(player.spriteSheet, player.x , player.y, 0, 2.5, 2.5)
end
