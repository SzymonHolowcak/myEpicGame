x = 400
y = 300
local Squeres = {}
local maxSquerers = 2
local squereScale = 5
local radius = 15
local width = 0.05
local height = 0.05
myFont = love.graphics.newFont(60)
local score = 0
bigChungus = {}
daBaby = {}

function love.load()
  bigChungus.image = love.graphics.newImage("big-chungus-jkg.png")
  daBaby.image = love.graphics.newImage("Happy-Baby-Transparent.png")
  babyCry = love.audio.newSource("baby-crying-08_01.wav", "stream")
  biC = love.audio.newSource("bigC.wav", "stream")
  biCTheme = love.audio.newSource("Big-Big-Chungus.wav", "stream")
love.audio.play(biCTheme)
end

function love.draw ()
  love.graphics.draw(bigChungus.image, x, y, 0, width, height, bigChungus.image:getWidth() / 2, bigChungus.image:getHeight() / 2)

  for i = 1, #Squeres do
    love.graphics.draw(daBaby.image, Squeres[i].X, Squeres[i].Y, 0, 0.1, 0.1, daBaby.image:getWidth() / 2, daBaby.image:getHeight() / 2)
  end

  love.graphics.setFont(myFont)
  love.graphics.print(score, 20, 10)
end

function love.update(dt)
  if love.keyboard.isDown("d") then
    x = x + 5
  end
  if love.keyboard.isDown("a") then
    x = x - 5
  end
  if love.keyboard.isDown("w") then
    y = y - 5
  end
  if love.keyboard.isDown("s") then
    y = y + 5
  end
  if x >= love.graphics.getWidth() then
    x = 0
  end
  if y >= love.graphics.getWidth() - 200 then
    y = 0
  end
  if x < 0 then
    x = love.graphics.getWidth()
  end
  if y < 0 then
    y = love.graphics.getWidth() - 200
  end
  if #Squeres < maxSquerers then
    local xPos = love.math.random() * love.graphics.getWidth() - squereScale
    local yPos = love.math.random() * love.graphics.getHeight() - squereScale
    table.insert(Squeres,makeSquere(xPos,yPos))
  end
  for i = 1, #Squeres do
    local S = Squeres[i]
    if S ~= nil then 
      local distace = math.sqrt(math.pow(x-S.X,2)+math.pow(y-S.Y,2))
      if distace < squereScale + radius then
        table.remove(Squeres,i)
        height = height + 0.01
        width = width + 0.01
        score = score + 1
        love.audio.play(babyCry)
      end
    end
  end
end

function makeSquere (x,y)
  local Square = {
    X = x, 
    Y = y, 
    scale = squereScale, 
  }
return Square
end