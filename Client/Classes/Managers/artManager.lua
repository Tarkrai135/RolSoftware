Object = require "Libs/classic"
ArtManager = Object:extend()

require "Classes/Art/maps"
require "Classes/Art/characters"
require "Classes/Art/locations"
require "Classes/Art/items"

screenWidth, screenHeight = love.graphics.getDimensions()
screenPartsWidth =  screenWidth / 4
screenPartsHeight = screenHeight / 4

mapsFolder = love.filesystem.getDirectoryItems("Assets/maps") 
mapsTable = {} 
mapDisplay = 1

charactersFolder = love.filesystem.getDirectoryItems("Assets/characters") 
charactersTable = {} 
charactersDrawTable = {}
characterX = screenPartsWidth / 2.5
characterY = screenPartsHeight * 3.5

locationsFolder = love.filesystem.getDirectoryItems("Assets/locations") 
locationsTable = {} 
locationsDisplay = 0

itemsFolder = love.filesystem.getDirectoryItems("Assets/items") 
itemsTable = {} 
itemSelected = 0
itemX = screenWidth / 2
itemY = screenHeight / 2

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

if characterClicked == "true" then
  
  table.remove(charactersDrawTable, characterSelected)
  table.insert(charactersDrawTable, characterSelected,charactersTable[characterSelected])
  
end

 if characterDeleted == "true" then
   
    charactersDrawTable[characterSelected] = nil
      
  end
  
 if deleteAllCharacters == "true" then
   
   for k,v in pairs(charactersDrawTable) do
      charactersDrawTable[k] = nil
   end
    
   
 end
 
    

end

function ArtManager:draw()
  
  mapsTable[mapDisplay]:draw()

  for k,v in pairs(charactersDrawTable) do
    
    v:draw()
    
  end
  
   if itemSelected > 0 then
    
    itemsTable[itemSelected]:draw()
    
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
          table.insert(charactersTable, Characters(tostring(v),characterX, characterY))
          if k < 5 then
          characterX = characterX + 270
        end
        
        if k > 5 then
         
          characterY = characterY - 270
          end
  end
  
end

function LocationLoad()
  
  for k,v in pairs(locationsFolder) do
          table.insert(locationsTable, Locations(tostring(v)))
  end
  
end

function ItemsLoad()
  
  for k,v in pairs(itemsFolder) do
          table.insert(itemsTable, Items(tostring(v), itemX, itemY ))
  end
  
end