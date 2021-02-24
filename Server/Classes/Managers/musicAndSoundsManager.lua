Object = require "Libs/classic"
MusicManager = Object:extend()

require "Classes/Music/music"
require "Classes/Music/ambientSounds"
require "Classes/Music/sounds"

musicFolder = love.filesystem.getDirectoryItems("Assets/music") 
musicTable = {} 
musicPlayTable = {}

ambientFolder = love.filesystem.getDirectoryItems("Assets/ambient sounds") 
ambientTable = {} 
ambientPlayTable = {}

soundsFolderBattle = love.filesystem.getDirectoryItems("Assets/sounds/battle") 
soundsFolderMisc = love.filesystem.getDirectoryItems("Assets/sounds/misc") 
soundsFolderNPC = love.filesystem.getDirectoryItems("Assets/sounds/NPC") 
soundsFolderWorld = love.filesystem.getDirectoryItems("Assets/sounds/world") 
soundsTableBattle = {} 
soundsTableMisc = {} 
soundsTableNPC = {} 
soundsTableWorld = {} 
soundsPlayTable = {}


function MusicManager:new()
  
  MusicLoad()
  
  AmbientLoad()
  
  SoundsLoad()
  
end


function MusicManager:update()
  
  for k,v in pairs(musicPlayTable) do
    v:update()
  end
  
  for k,v in pairs(ambientPlayTable) do
    v:update()
  end
 
  for k,v in pairs(soundsPlayTable) do
    v:update()
  end
  
  
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

