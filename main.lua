x = 100
y = 485

function jumpT()
  y = y - 10
  if y == y - 10 then
    y = y + 10
  end
end

function love.draw ()
  love.graphics.setColor(255, 0, 0)
  love.graphics.circle('fill',x,y,15)
  love.graphics.setColor(255,255,255)
  love.graphics.polygon('fill',0,500,0,505,10000,505,10000,500)
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    x = x + 5
  end
  if love.keyboard.isDown("left") then
    x = x - 5
  end
  if love.keyboard.isDown("up") then
    jumpT()
  end
end