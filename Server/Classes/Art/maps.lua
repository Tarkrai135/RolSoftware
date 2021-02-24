Object = require "Libs/classic"
Maps = Object:extend()



function Maps:new(spriteName, x ,y)
  
  self.x = x or 0
  self.y = y or 0
  self.spriteName = "Assets/maps/"..spriteName
  
  self.maps = love.graphics.newImage(self.spriteName)
  self.mapsW, self.mapsH = Maps:GetImageScaleForNewDimensions(self.maps, screenPartsWidth * 3, screenPartsHeight * 4)
  
end

function Maps:update()
  
  
  
end

function Maps:draw()
  
  love.graphics.draw(self.maps, self.x, self.y, 0, self.mapsW, self.mapsH)
  
end



function Maps:GetImageScaleForNewDimensions(Sprite, newWidth, newHeight)
    local currentWidth, currentHeight = Sprite:getDimensions()
    return ( newWidth / currentWidth ), ( newHeight / currentHeight )
end

