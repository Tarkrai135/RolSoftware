
Object = require "Libs/classic"
UiAmbientSounds = Object:extend()

suit = require "Libs/suit-master"


function UiAmbientSounds:new()
  
  self.w = screenPartsWidth / 4.8
  self.h = screenPartsHeight / 9
  
  self.ambientX = screenWidth / 1.2155
  self.ambientY = screenPartsHeight / 3.3
  
end

function UiAmbientSounds:update()
  
  UiAmbientSounds:SelectAmbientUi(self.ambientX, self.ambientY, self.w, self.h)
  
  
end

function UiAmbientSounds:draw()
  
 
  
end

function UiAmbientSounds:SelectAmbientUi(x, y, w, h)
  
  local count = 1 
  
  if suit.Button("Ambients", x, y, w, h).hit then
    ambient = true
  end

  
  if ambient then
    UiAmbientSounds:Volumes(x,y,w,h,count)
    y = y + 30
    
    for k,v in pairs(musicTable) do
     
    UiAmbientSounds:ChooseAmbient(x,y,w,h,count)
    
    count = count + 1  
    y = y + 30
      
    end
    
  if suit.Button("close Ambs", x, y, w, h).hit then
    ambient = false
  end
   
end
   
end


function UiAmbientSounds:ChooseAmbient(x,y,w,h,count)
  
  
  if suit.Button(string.gsub(ambientFolder[count], ".wav", "") , x, y, w, h).hit then
      table.remove(ambientPlayTable, count)
      table.insert(ambientPlayTable, count, ambientTable[count])
      ambientPlayTable[count]:startPlay()
  end
  
  if suit.Button ("Stop"..tostring(count).."  ", x + 100, y + 8, w / 2, h / 2).hit then
      
      ambientPlayTable[count]:stopPlay()
    
    end
  
end

function UiAmbientSounds:Volumes(x,y,w,h,count)
  
  if suit.Button ("+ S", x + 100, y, w / 2, h / 2).hit then
      ambientSoundsVolume = ambientSoundsVolume + 0.1
  end
    
  if suit.Button ("- S", x + 100, y + 16, w / 2, h / 2).hit then
      ambientSoundsVolume = ambientSoundsVolume - 0.1
  end
  
end
