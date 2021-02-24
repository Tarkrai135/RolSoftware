Object = require "Libs/classic"
MusicManager = Object:extend()

require "Classes/Music/music"
require "Classes/Music/ambientSounds"
require "Classes/Music/sounds"

suit = require "Libs/suit-master"

musicFolder = love.filesystem.getDirectoryItems("Assets/music") 
musicTable = {} 
musicPlaying = 0

ambientFolder = love.filesystem.getDirectoryItems("Assets/ambient sounds") 
ambientTable = {} 


soundsFolderBattle = love.filesystem.getDirectoryItems("Assets/sounds/battle") 
soundsFolderMisc = love.filesystem.getDirectoryItems("Assets/sounds/misc") 
soundsFolderNPC = love.filesystem.getDirectoryItems("Assets/sounds/NPC") 
soundsFolderWorld = love.filesystem.getDirectoryItems("Assets/sounds/world") 
soundsTableBattle = {} 
soundsTableMisc = {} 
soundsTableNPC = {} 
soundsTableWorld = {} 

generalVolume = 0.5

generalVolumeUpX = screenWidth / 1.299052774018945
generalVolumeUpY = screenPartsHeight / 5.4

generalVolumeDownX = screenWidth / 1.299052774018945
generalVolumeDownY = (screenPartsHeight / 5.4) + 31

generalVolumeUpW = screenPartsWidth / 4.8
generalVolumeUpH = screenPartsHeight / 9


function MusicManager:new()
  
  MusicLoad()
  
  AmbientLoad()
  
  SoundsLoad()
  
end


function MusicManager:update()
  
 love.audio.setVolume(generalVolume)
  
  if musicPlaying > 0 then
  musicTable[musicPlaying]:startPlay()
  end

  if stopMusic == "true" then
    for k,v in pairs(musicTable) do
    v:stopPlay()
    end
  end
  
  if ambientPlay == "true" then 
    if ambientSelected > 0 then
      ambientTable[ambientSelected]:startPlay()
    end
  end
  
  if ambientStop == "true" then
    for k,v in pairs(ambientTable) do
      v:stopPlay()
    end
  end
  
  
  
  if soundPlay == "true" then
    
    if soundFolder == 1 then
      
      for k,v in pairs(soundsTableBattle) do
        if k == soundSelected then
          v:playSound()
          end
      end
      
    end
    
      if soundFolder == 2  then
      
      for k,v in pairs(soundsTableMisc) do
        
        if k == soundSelected then
          v:playSound()
          end
        end
      end
    
    if soundFolder == 3 then
    
      for k,v in pairs(soundsTableNPC) do
        
          if k == soundSelected then
            v:playSound()
          end
        end
      end
  
    if soundFolder == 4  then
    
      for k,v in pairs(soundsTableWorld) do
        
        if k == soundSelected then
          v:playSound()
          end
        
      end
      end
    end
    
 
  
  
  --EndUpdate
end

function MusicLoad()
  
  for k,v in pairs(musicFolder) do
          table.insert(musicTable, Music(tostring(v)))
  end
  
end

function AmbientLoad()
  
  for k,v in pairs(ambientFolder) do
          table.insert(ambientTable, AmbientSounds(tostring(v)))
  end
  
end

function SoundsLoad()
  
  for k,v in pairs(soundsFolderBattle) do
          table.insert(soundsTableBattle, Sounds("battle/"..tostring(v)))
  end
  
  for k,v in pairs(soundsFolderMisc) do
          table.insert(soundsTableMisc, Sounds("misc/"..tostring(v)))
  end
  
  for k,v in pairs(soundsFolderNPC) do
          table.insert(soundsTableNPC, Sounds("NPC/"..tostring(v)))
  end
  
  for k,v in pairs(soundsFolderWorld) do
          table.insert(soundsTableWorld, Sounds("world/"..tostring(v)))
  end
  
end

