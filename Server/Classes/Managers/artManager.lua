Object = require "Libs/classic"
ArtManager = Object:extend()

require "Classes/Art/maps"
require "Classes/Art/characters"
require "Classes/Art/locations"
require "Classes/Art/items"

mapsFolder = love.filesystem.getDirectoryItems("Assets/maps") 
mapsTable = {} 
mapDisplay = 1

charactersFolder = love.filesystem.getDirectoryItems("Assets/characters") 
charactersTable = {} 
charactersDrawTable = {}

locationsFolder = love.filesystem.getDirectoryItems("Assets/locations") 
locationsTable = {} 
locationsDisplay = 0

itemsFolder = love.filesystem.getDirectoryItems("Assets/items") 
itemsTable = {} 
itemsDisplay = 0

function ArtManager:new()
  
  MapLoad()
  
  CharactersLoad()
  
  LocationLoad()
  
  ItemsLoad()
  
end

function ArtManager:update(dt)
  
   for k,v in pairs(charactersDrawTable) do
    
      v:update(dt)
      
  end
  
   if itemsDisplay > 0 then
    
    itemsTable[itemsDisplay]:update(dt)
    
  end

end

function ArtManager:draw()
  
  mapsTable[mapDisplay]:draw()
    
  for k,v in pairs(charactersDrawTable) do
    
    v:draw()
    
  end
  if itemsDisplay > 0 then
    
    itemsTable[itemsDisplay]:draw()
    
  end
  
  
  
  
  if locationsDisplay > 0 then
    
    locationsTable[locationsDisplay]:draw()
    
  end
  

  
end


function MapLoad()
  
  for k,v in pairs(mapsFolder) do
          table.insert(mapsTable, Maps(tostring(v)))
  end
  
end

function CharactersLoad()
  
  for k,v in pairs(charactersFolder) do
          table.insert(charactersTable, Characters(tostring(v)))
  end
  
end

function LocationLoad()
  
  for k,v in pairs(locationsFolder) do
          table.insert(locationsTable, Locations(tostring(v)))
  end
  
end

function ItemsLoad()
  
  for k,v in pairs(itemsFolder) do
          table.insert(itemsTable, Items(tostring(v)))
  end
  
end