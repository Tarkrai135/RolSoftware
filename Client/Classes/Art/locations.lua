Object = require "Libs/classic"
Locations = Object:extend()

function Locations:new(spriteName, x ,y)
  
  self.x = x or 0
  self.y = y or 0
  self.spriteName = "Assets/locations/"..spriteName
  
  self.locations = love.graphics.newImage(self.spriteName)
  self.locationsW, self.locationsH = Maps:GetImageScaleForNewDimensions(self.locations, screenPartsWidth * 3, screenPartsHeight * 4)
  
end

function Locations:draw()
  
  love.graphics.draw(self.locations, self.x, self.y, 0, self.locationsW, self.locationsH)
  
end



function Locations:GetImageScaleForNewDimensions(Sprite, newWidth, newHeight)
    local currentWidth, currentHeight = Sprite:getDimensions()
    return ( newWidth / currentWidth ), ( newHeight / currentHeight )
end
