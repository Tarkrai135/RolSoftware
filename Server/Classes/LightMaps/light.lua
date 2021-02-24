Object = require "Libs/classic"
LightMap = Object:extend()

Shadows = require("shadows")
LightWorld = require("shadows.LightWorld")
Light = require("shadows.Light")
Body = require("shadows.Body")
PolygonShadow = require("shadows.ShadowShapes.PolygonShadow")
CircleShadow = require("shadows.ShadowShapes.CircleShadow")

time = 0

function LightMap:new()
  
  newLightWorld = LightWorld:new()
  
  self.lightSize = 50
  self.click = false
  self.drawMap = false
  self.resetShadow = false
  
end


function LightMap:update()
  
  newLightWorld:Update()
  
  self.click = love.mouse.isDown(1)
  
  if self.click then
    
    if self.drawMap then
      
      UiLight = Light:new(newLightWorld, self.lightSize)
      UiLight:SetPosition(mouseX,mouseY)  
      UiLight:SetColor(255, 255, 255, 255)
      
    end
  
  end
  if self.drawMap then
  function love.wheelmoved(x,y)
    
     if self.click == false then
      if y > 0 then
       self.lightSize = self.lightSize + 5
      end
    
      if y < 0 then
        if self.lightSize > 10 then
          self.lightSize = self.lightSize - 5
        end
      end
     end 
      
  end
  end
  --]]
  function love.keypressed(key, scancode)
    
    if key == "n" then
      if self.drawMap == true then
        self.drawMap = false 
      elseif self.drawMap == false then
        self.drawMap = true 
      end
    end
  
    if key == "m" then
      newLightWorld = LightWorld:new()
      self.resetShadow = true
      
    end
    
  end
  
  --Send
  if self.resetShadow == true then
    time = time + 1
    if time > 10 then
        self.resetShadow = false
        time = 0
    end
  end  
  
  --UPDATE
  
end


function LightMap:draw()
  
  if self.drawMap then
    newLightWorld:Draw()
  end
  
end


