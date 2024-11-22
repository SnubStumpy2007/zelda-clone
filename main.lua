function love.load()
  player = require('modules.player')
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
end

function love.draw()
  love.graphics.draw(player.sprite, player.x, player.y)
end
