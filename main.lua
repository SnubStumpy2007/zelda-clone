
function love.load()
  -- modules
  player = require('modules.player')

  -- libraries
 anim8 = require 'libraries/anim8'
 
end

function love.update(dt)
  if love.keyboard.isDown('w') then
    player.y = player.y - player.speed
    elseif love.keyboard.isDown('a') then
      player.x = player.x - player.speed
    elseif love.keyboard.isDown('s') then
      player.y = player.y + player.speed
    elseif love.keyboard.isDown('d') then
      player.x = player.x + player.speed
    end

    player.anim:update(dt)
end

function love.draw()
 -- love.graphics.draw(player.sprite, player.x, player.y)
 player.anim:draw(player.spritSheet, player.x, player.y)
end
