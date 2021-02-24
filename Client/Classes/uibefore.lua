Object = require "Libs/classic"
Ui = Object:extend()

suit = require "Libs/suit-master"

charactersDrawTable = {}
itemsDrawTable = {}


function Ui:new()
  
  self.w = screenPartsWidth / 4.8
  self.h = screenPartsHeight / 9
  
  self.mapsX = screenWidth / 1.299052774018945
  self.mapsY = screenPartsHeight / 5.4
  
  self.charactersX = screenWidth / 1.2155
  self.charactersY = screenPartsHeight / 5.4
 
  self.locationsX = screenWidth / 1.1419
  self.locationsY = screenPartsHeight / 5.4
  
  self.itemsX = screenWidth / 1.0766
  self.itemsY = screenPartsHeight / 5.4

end

function Ui:update()
  
  Ui:Maps(self.mapsX, self.mapsY, self.w, self.h)
  Ui:Characters(self.charactersX, self.charactersY, self.w, self.h)
  Ui:Locations(self.locationsX, self.locationsY, self.w, self.h)
  Ui:Items(self.itemsX, self.itemsY, self.w, self.h)
  
end


function Ui:draw()
  
   suit.draw()
   
   Ui:DrawCharacter()
   
   Ui:DrawItems()
   
end



--MAPS
function Ui:Maps(x, y, w, h)
  
  local count = 1 
  
  if suit.Button("Zone Maps", x, y, w, h).hit then
    zoneMaps = true
  end

  
  if zoneMaps then
    
    y = y + 30
    
    for k,v in pairs(mapsTable) do
      
    Ui:SelectMapUi(x,y,w,h,count)
    
    count = count + 1  
    y = y + 30
      
  end
    
  if suit.Button("close", x, y, w, h).hit then
    zoneMaps = false
  end
    
end
  


end

function Ui:SelectMapUi(x,y,w,h,count)
  
  if suit.Button(string.gsub(mapsFolder[count], ".jpg", " Map") , x, y, w, h).hit then
      if count <= table.getn(mapsFolder)  then
          mapDisplay = count
      end
    end

  
end

--LOCATIONS

function Ui:Locations(x,y,w,h)
  
  local count = 1 
  
  if suit.Button("Locations", x, y, w, h).hit then
    locations = true
  end

  
  if locations then
    
    y = y + 30
    
    for k,v in pairs(locationsTable) do
      
      Ui:SelectLocationsUi(x,y,w,h,count)
    
      count = count + 1  
      y = y + 30
      
    end
    
    if suit.Button("Erase Locations", x, y, w, h).hit then
      locationsDisplay = 0
    end
    
    count = count + 1  
    y = y + 30
    
    if suit.Button("close", x, y, w, h).hit then
      locations = false
    end
    
  end
  
end

function Ui:SelectLocationsUi(x,y,w,h,count)
  
  if suit.Button(string.gsub(locationsFolder[count], ".jpg", "") , x, y, w, h).hit then
      if count <= table.getn(locationsFolder)  then
          locationsDisplay = count
      end
    end
  
  --print(tostring(locationsFolder[count]))
  end

--CHARACTERS

function Ui:Characters(x, y, w, h)
  
  local count = 1 

  if suit.Button("Characters", x, y, w, h).hit then
    CharactersImage = true
  end
  
  if CharactersImage then
    
    y = y + 30
    
    for k,v in pairs(charactersTable) do
      
      Ui:AddCharacterUi(x,y,w,h,count)
    
      count = count + 1  
      y = y + 30
      
    end
    
    if suit.Button("Erase All Chars", x, y, w, h).hit then
      for k in pairs(charactersDrawTable) do
            charactersDrawTable[k] = nil
      end
    end
    
    count = count + 1  
    y = y + 30
    
    if suit.Button("Close", x, y, w, h).hit then
      CharactersImage = false
    end
    
  end
    
end


  
function Ui:AddCharacterUi(x,y,w,h,count)
  
  
  if suit.Button(string.gsub(charactersFolder[count], ".png", "") , x, y, w, h).hit then
      table.remove(charactersDrawTable, count)
      table.insert(charactersDrawTable, count, charactersTable[count])
  end
  
  if suit.Button ("Close".." "..tostring(count), x + 100, y + 8, w / 2, h / 2).hit then
          for k in pairs(charactersDrawTable) do
            charactersDrawTable[count] = nil
          end
    end
  
end

function Ui:DrawCharacter()
  
  for k,v in pairs(charactersDrawTable) do
    v:draw()
  end

end

--ITEMS

function Ui:Items(x, y, w, h)
  
  local count = 1 

  if suit.Button("Items", x, y, w, h).hit then
    itemsImage = true
  end
  
  if itemsImage then
    
    y = y + 30
    
    for k,v in pairs(itemsTable) do
      
      Ui:AddItemsUi(x,y,w,h,count)
    
      count = count + 1  
      y = y + 30
      
    end
    
    if suit.Button("Erase All Items", x, y, w, h).hit then
      for k in pairs(itemsDrawTable) do
            itemsDrawTable[k] = nil
      end
    end
    
    count = count + 1  
    y = y + 30
    
    if suit.Button("Close", x, y, w, h).hit then
      itemsImage = false
    end
    
  end
    
end

function Ui:AddItemsUi(x,y,w,h,count)
  
  
  if suit.Button(string.gsub(itemsFolder[count], ".png", "") , x, y, w, h).hit then
      table.remove(itemsDrawTable, count)
      table.insert(itemsDrawTable, count, itemsTable[count])
  end
  
  if suit.Button ("Close".." "..tostring(count), x + 100, y + 8, w / 2, h / 2).hit then
          for k in pairs(itemsDrawTable) do
            itemsDrawTable[count] = nil
          end
    end
  
end

function Ui:DrawItems()
  
  for k,v in pairs(itemsDrawTable) do
    v:draw()
  end

end

 
   




