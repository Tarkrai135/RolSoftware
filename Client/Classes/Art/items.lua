Object = require "Libs/classic"
Items = Object:extend()

function Items:new(spriteName, x ,y)
  
  self.x = x or 400
  self.y = y or 400
  self.speed = 400
  self.spriteName = "Assets/items/"..spriteName
  
  self.item = love.graphics.newImage(self.spriteName)
  
  self.itemW = self.item:getWidth()
  self.itemH = self.item:getHeight()
  
  self.mouseSpeedX = self.itemW / 20
  self.mouseSpeedY = self.itemH / 20

   if self.itemW > 500 and self.itemH > 500 then
     self.itemW = self.itemW / 2
     self.itemH = self.itemH / 2
  end
  
  self.offsetX = self.itemW / 2
  self.offsetY = self.itemH / 2
  
  
end

function Items:update(dt)
  
end

function Items:draw()
  
 
  
  self.itemDimensionW, self.itemDimensionH = Items:GetImageScaleForNewDimensions(self.item, self.itemW, self.itemH)
  
  love.graphics.draw(self.item, self.x - self.offsetX, self.y - self.offsetY, 0 , self.itemDimensionW, self.itemDimensionH)
  
  
end

function Items:GetImageScaleForNewDimensions(Sprite, newWidth, newHeight)
    local currentWidth, currentHeight = Sprite:getDimensions()
    return ( newWidth / currentWidth ), ( newHeight / currentHeight )
end

function Items:Colision(x,y,w,h,mx,my)
  
  if mx > x and my > y and mx < (x + w) and my < (y + h) then
    return true
  else
    return false
  end
  
end

