Object = require "Libs/classic"
Characters = Object:extend()

function Characters:new(spriteName, x ,y)
  
  self.x = x or 400
  self.y = y or 400
  self.speed = 400
  self.spriteName = "Assets/characters/"..spriteName
  
  self.character = love.graphics.newImage(self.spriteName)
  
  self.characterW = self.character:getWidth() 
  self.characterH = self.character:getHeight() 
  
  if self.characterW <= 500 and self.characterW > 250 and self.characterH <= 500 and self.characterH > 250 then
     self.characterW = self.characterW / 2
     self.characterH = self.characterH / 2
   elseif self.characterW > 500 and self.characterH > 500 then
     self.characterW = self.characterW / 3
     self.characterH = self.characterH / 3
  end
   
  
  self.mouseSpeedX = self.characterW / 20
  self.mouseSpeedY = self.characterH / 20
  
  self.characterDimensionW, self.characterDimensionH = Characters:GetImageScaleForNewDimensions(self.character, self.characterW, self.characterH)
  
  self.offsetX = self.characterW / 2
  self.offsetY = self.characterH / 2
end

function Characters:update(dt)
  
  mx, my = love.mouse.getPosition()
  
  self.offsetX = self.characterW / 2
  self.offsetY = self.characterH / 2

 
end

function Characters:draw()
  
  self.characterDimensionW, self.characterDimensionH = Characters:GetImageScaleForNewDimensions(self.character, self.characterW, self.characterH)
  
  love.graphics.draw(self.character, self.x - self.offsetX, self.y - self.offsetY, 0 , self.characterDimensionW, self.characterDimensionH)
  
end





function Characters:GetImageScaleForNewDimensions(Sprite, newWidth, newHeight)
    local currentWidth, currentHeight = Sprite:getDimensions()
    return ( newWidth / currentWidth ), ( newHeight / currentHeight )
end

function Characters:Colision(x,y,w,h,mx,my)
  
  if mx > x and my > y and mx < (x + w) and my < (y + h) then
    return true
  else
    return false
  end
  
end
