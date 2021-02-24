Object = require "Libs/classic"
UiMaps = Object:extend()

suit = require "Libs/suit-master"


function UiMaps:new()
  
  self.w = screenPartsWidth / 4.8
  self.h = screenPartsHeight / 9
  
  self.mapsX = screenWidth / 1.299052774018945
  self.mapsY = screenPartsHeight / 5.4
  
end

function UiMaps:update()
  
  UiMaps:Maps(self.mapsX, self.mapsY, self.w, self.h)
  
  
end

function UiMaps:draw()
  
 
  
end

function UiMaps:Maps(x, y, w, h)
  
  local count = 1 
  
  if suit.Button("Zone Maps", x, y, w, h).hit then
    zoneMaps = true
  end

  
  if zoneMaps then
    
    y = y + 30
    
    for k,v in pairs(mapsTable) do
      
    UiMaps:SelectMapUi(x,y,w,h,count)
    
    count = count + 1  
    y = y + 30
      
  end
    
  if suit.Button("close Maps", x, y, w, h).hit then
    zoneMaps = false
  end
    
end
  
end

function UiMaps:SelectMapUi(x,y,w,h,count)
  
  local stringButton = string.gsub(mapsFolder[count], ".jpg", " Map")
  
  if suit.Button(stringButton, x, y, w, h).hit then
      if count <= table.getn(mapsFolder)  then
          mapDisplay = count
      end
    end

  
end