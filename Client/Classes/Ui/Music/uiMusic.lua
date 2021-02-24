Object = require "Libs/classic"
UiMusic = Object:extend()

suit = require "Libs/suit-master"


function UiMusic:new()
  
  self.w = screenPartsWidth / 4.8
  self.h = screenPartsHeight / 9
  
  self.musicX = screenWidth / 1.299052774018945
  self.musicY = screenPartsHeight / 3.3
  
end

function UiMusic:update()
  
  UiMusic:SelectMusicUi(self.musicX, self.musicY, self.w, self.h)
  
  
end

function UiMusic:draw()
  
 
  
end

function UiMusic:SelectMusicUi(x, y, w, h)
  
  local count = 1 
  
  if suit.Button("Music", x, y, w, h).hit then
    music = true
  end

  
  if music then
    UiMusic:Volumes(x,y,w,h,count)
    y = y + 30
    
    for k,v in pairs(musicTable) do
     
    UiMusic:ChooseSong(x,y,w,h,count)
    
    count = count + 1  
    y = y + 30
      
    end
    
  if suit.Button("close Music", x, y, w, h).hit then
    music = false
  end
   
end
   
end


function UiMusic:ChooseSong(x,y,w,h,count)
  
  
  if suit.Button(string.gsub(musicFolder[count], ".mp3", "") , x, y, w, h).hit then
      table.remove(musicPlayTable, count)
      table.insert(musicPlayTable, count, musicTable[count])
      musicPlayTable[count]:startPlay()
  end
  
  if suit.Button ("Stop"..tostring(count).." ", x + 100, y + 8, w / 2, h / 2).hit then
          musicPlayTable[count]:stopPlay()
    end
  
end

function UiMusic:Volumes(x,y,w,h,count)
  
  if suit.Button ("+ M", x + 100, y, w / 2, h / 2).hit then
      musicVolume = musicVolume + 0.1
  end
    
  if suit.Button ("- M", x + 100, y + 16, w / 2, h / 2).hit then
      musicVolume = musicVolume - 0.1
  end
  
end
