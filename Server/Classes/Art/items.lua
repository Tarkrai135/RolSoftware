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
  
  self.offsetX = self.itemW / 2
  self.offsetY = self.itemH / 2
  
end

function Items:update(dt)
  
  mx, my = love.mouse.getPosition()
  
  self.offsetX = self.itemW / 2
  self.offsetY = self.itemH / 2
   
 for k,v in pairs(itemsTable) do
  
  if love.mouse.isDown(1) and Items:Colision(v.x - v.offsetX, v.y - v.offsetY, v.itemW, v.itemH, mx, my) then
    
    v.mouseWheelSpeedX = v.itemW / 20
    v.mouseWheelSpeedY = v.itemH / 20
    
    function love.wheelmoved(x,y)
     
      if y > 0 then
       v.itemW = v.itemW + v.mouseWheelSpeedX
       v.itemH = v.itemH + v.mouseWheelSpeedY
      end
    
      if y < 0 then
       v.itemW = v.itemW - v.mouseWheelSpeedX
       v.itemH = v.itemH - v.mouseWheelSpeedY
      end
      
      
    end
  
      v.x = mx + self.speed * dt
      v.y = my + self.speed * dt
      
  end
   
 end
  
  
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

