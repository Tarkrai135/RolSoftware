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
  
  self.mouseSpeedX = self.characterW / 20
  self.mouseSpeedY = self.characterH / 20
  
  self.offsetX = self.characterW / 2
  self.offsetY = self.characterH / 2
  
end

function Characters:update(dt)
  
  mx, my = love.mouse.getPosition()
  
  self.offsetX = self.characterW / 2
  self.offsetY = self.characterH / 2
   
 for k,v in pairs(charactersDrawTable) do
  
  if love.mouse.isDown(1) and Characters:Colision(v.x - v.offsetX, v.y - v.offsetY, v.characterW, v.characterH, mx, my) then
    
    sendCharacterSelected = k
    
    v.mouseWheelSpeedX = v.characterW / 20
    v.mouseWheelSpeedY = v.characterH / 20
    
    function love.wheelmoved(x,y)
     
      if y > 0 then
       v.characterW = v.characterW + v.mouseWheelSpeedX
       v.characterH = v.characterH + v.mouseWheelSpeedY
      end
    
      if y < 0 then
       v.characterW = v.characterW - v.mouseWheelSpeedX
       v.characterH = v.characterH - v.mouseWheelSpeedY
      end
      
      
    end
      
        v.x = mx + self.speed * dt
        v.y = my + self.speed * dt
      
  end
    
   
   
 end
  
 --End update
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
