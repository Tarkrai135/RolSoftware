Object = require "Libs/classic"
LightMap = Object:extend()

Shadows = require("shadows")
LightWorld = require("shadows.LightWorld")
Light = require("shadows.Light")
Body = require("shadows.Body")
PolygonShadow = require("shadows.ShadowShapes.PolygonShadow")
CircleShadow = require("shadows.ShadowShapes.CircleShadow")



function LightMap:new()
  
  shadowWorld = LightWorld:new()
  
end


function LightMap:update()
  
  shadowWorld:Update()
  
  
  
  if click == "true" then
    
    if drawLightMap == "true" then
     
      lightPoint = Light:new(shadowWorld,tonumber(lightSize))
      lightPoint:SetPosition(mouseX, mouseY)
      lightPoint:SetColor(255,255,255,255)
      
    end
  
  end
  
  function love.wheelmoved(x,y)
    
      
  end
  
  if resetLightMap == "true" then
      shadowWorld = LightWorld:new()
  end
  
end


function LightMap:draw()
  
  if drawLightMap == "true" then
   shadowWorld:Draw()
  end
  
  
  --love.graphics.print(tostring(drawLightMap).." "..tostring(resetLightMap).." "..tostring(click).." "..tostring(lightSize), 50, 50)

end