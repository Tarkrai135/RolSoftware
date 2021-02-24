Object = require "Libs/classic"
UiSounds = Object:extend()

suit = require "Libs/suit-master"


function UiSounds:new()
  
  self.w = screenPartsWidth / 4.8
  self.h = screenPartsHeight / 9
  
  self.soundX = screenWidth / 1.1419
  self.soundY = screenPartsHeight / 3.3
  
end

function UiSounds:update()
  
  UiSounds:SelectSoundsUi(self.soundX, self.soundY, self.w, self.h)
  
  
end

function UiSounds:draw()
  
 
  
end

function UiSounds:SelectSoundsUi(x, y, w, h)
  
  local count = 1 
  
  if suit.Button("Sounds", x, y, w, h).hit then
    sounds = true
  end

--SOUNDS
  
  if sounds then
    
    UiSounds:Volumes(x + 1,y,w,h,count)
    
    if suit.Button("Close", x + 152, y, w/2, h).hit then
    sounds = false
    end
    
    y = y + 32
    x = x - 203
    local yPosition = y
    
    --BATTLE
    
    if suit.Button("Battle",x,y,w,h).hit then
      
      battleSounds = true
      
    end
    
    if battleSounds then
      
      y = yPosition
      y = y + 30
      count = 1
      
      for k,v in pairs(soundsTableBattle) do
        
        UiSounds:BattleSounds(x,y,w,h,count)
        y = y + 30
        count = count + 1
      end
    
      if suit.Button ("Close Battle", x, y, w , h ).hit then
        battleSounds = false
      end
    end
    
    x = x + 102
    
    --MISC
    
    if suit.Button("Misc",x,yPosition,w,h).hit then
      
      miscSounds = true
      
    end
    
    if miscSounds then
      
      y = yPosition
      y = y + 30
      count = 1
      
      for k,v in pairs(soundsTableMisc) do
        
        UiSounds:MiscSounds(x,y,w,h,count)
        y = y + 30
        count = count + 1
        
      end
      
      if suit.Button ("Close Misc", x, y, w , h ).hit then
        miscSounds = false
      end
      
    end
    
     x = x + 102
     
     --NPC
     
    if suit.Button("NPC",x,yPosition,w,h).hit then
      
      NPCSounds = true
      
    end
    
    if NPCSounds then
      
      y = yPosition
      y = y + 30
      count = 1
      
      for k,v in pairs(soundsTableNPC) do
        
        UiSounds:NPCSounds(x,y,w,h,count)
        y = y + 30
        count = count + 1
        
      end
      
      if suit.Button ("Close NPC", x, y, w , h ).hit then
        NPCSounds = false
      end
      
    end
    
     x = x + 102
     
     
     
     --WORLD
     
    if suit.Button("World",x,yPosition,w,h).hit then
      
      worldSounds = true
      
      
    end
    
    if worldSounds then
      
      y = yPosition
      y = y + 30
      count = 1
      
      for k,v in pairs(soundsTableWorld) do
        
        UiSounds:WorldSounds(x,y,w,h,count)
        y = y + 30
        count = count + 1
        
      end
      
      if suit.Button ("Close World", x, y, w , h ).hit then
        worldSounds = false
      end
      
    end
    
     x = x + 102
   
    
    
    
  
   
end
   
end


function UiSounds:BattleSounds(x,y,w,h,count)
    
  if suit.Button(string.gsub(soundsFolderBattle[count], ".wav", "") , x, y, w, h).hit then
      for k in pairs(soundsPlayTable) do 
        soundsPlayTable[k] = nil
      end
      table.insert(soundsPlayTable, soundsTableBattle[count])
      playSound = true
      sendSoundFolder = 1
      sendSoundSelected = count
      sendSoundPlay = true
  end
  
end

function UiSounds:MiscSounds(x,y,w,h,count)
   
  if suit.Button(string.gsub(soundsFolderMisc[count], ".wav", " ") , x, y, w, h).hit then
      for k in pairs(soundsPlayTable) do 
        soundsPlayTable[k] = nil
      end
      table.insert(soundsPlayTable, soundsTableMisc[count])
      playSound = true
      sendSoundFolder = 2
      sendSoundSelected = count
      sendSoundPlay = true
  end
  
end

function UiSounds:NPCSounds(x,y,w,h,count)
   
  if suit.Button(string.gsub(soundsFolderNPC[count], ".wav", " ") , x, y, w, h).hit then
      for k in pairs(soundsPlayTable) do 
        soundsPlayTable[k] = nil
      end
      table.insert(soundsPlayTable, soundsTableNPC[count])
      playSound = true
      sendSoundFolder = 3
      sendSoundSelected = count
      sendSoundPlay = true
  end
  
end

function UiSounds:WorldSounds(x,y,w,h,count)
   
  if suit.Button(string.gsub(soundsFolderWorld[count], ".wav", " ") , x, y, w, h).hit then
      for k in pairs(soundsPlayTable) do 
        soundsPlayTable[k] = nil
      end
      table.insert(soundsPlayTable, soundsTableWorld[count])
      playSound = true
      sendSoundFolder = 4
      sendSoundSelected = count
      sendSoundPlay = true
  end
  
end

function UiSounds:Volumes(x,y,w,h,count)
  
  if suit.Button ("+   ", x + 100, y, w / 2, h / 2).hit then
      soundsVolume = soundsVolume + 0.1
  end
    
  if suit.Button ("-   ", x + 100, y + 16, w / 2, h / 2).hit then
      soundsVolume = soundsVolume - 0.1
  end
  
end
