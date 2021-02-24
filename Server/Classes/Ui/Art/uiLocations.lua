Object = require "Libs/classic"
UiLocations = Object:extend()

suit = require "Libs/suit-master"



function UiLocations:new()
  
  self.w = screenPartsWidth / 4.8
  self.h = screenPartsHeight / 9
  
  self.locationsX = screenWidth / 1.1419
  self.locationsY = screenPartsHeight / 5.4
  
end

function UiLocations:update()
  
  UiLocations:SetUi(self.locationsX, self.locationsY, self.w, self.h)
  
end

function UiLocations:draw()
  
 
  
end


function UiLocations:SetUi(x,y,w,h)
  
  
  local count = 1 
  
  if suit.Button("Locations", x, y, w, h).hit then
    openLocations = true
  end

  
  if openLocations then
    
    y = y + 30
    
    for k,v in pairs(locationsTable) do
      
      UiLocations:SelectLocation(x,y,w,h,count)
    
      count = count + 1  
      y = y + 30
      
    end
    
    if suit.Button("Erase Lcns", x, y, w, h).hit then
      locationsDisplay = 0
    end
    
    count = count + 1  
    y = y + 30
    
    if suit.Button("close Locs", x, y, w, h).hit then
      openLocations = false
    end
    
  end
  
end

function UiLocations:SelectLocation(x,y,w,h,count)
  
  if suit.Button(string.gsub(locationsFolder[count], ".jpg", "") , x, y, w, h).hit then
      if count <= table.getn(locationsFolder)  then
          locationsDisplay = count
      end
    end
  
  end
