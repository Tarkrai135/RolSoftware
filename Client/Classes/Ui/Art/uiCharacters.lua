Object = require "Libs/classic"
UiCharacters = Object:extend()

suit = require "Libs/suit-master"

function UiCharacters:new()
  
  self.w = screenPartsWidth / 4.8
  self.h = screenPartsHeight / 9
  
  self.charactersX = screenWidth / 1.2155
  self.charactersY = screenPartsHeight / 5.4
  
end

function UiCharacters:update()
  
  SetCharacters(self.charactersX, self.charactersY, self.w, self.h)
  
end

function UiCharacters:draw()
   
  
end

function SetCharacters(x, y, w, h)
  
  local count = 1 

  if suit.Button("Characters", x, y, w, h).hit then
    CharactersImage = true
  end
  
  if CharactersImage then
    
    y = y + 30
    
    for k,v in pairs(charactersTable) do
      
      UiCharacters:AddCharacter(x,y,w,h,count)
    
      count = count + 1  
      y = y + 30
      
    end
    
    if suit.Button("Erase Chars", x, y, w, h).hit then
      for k in pairs(charactersDrawTable) do
            charactersDrawTable[k] = nil
      end
    end
    
    count = count + 1  
    y = y + 30
    
    if suit.Button("Close Chars", x, y, w, h).hit then
      CharactersImage = false
    end
    
  end
    
end


  
function UiCharacters:AddCharacter(x,y,w,h,count)
  
  
  if suit.Button(string.gsub(charactersFolder[count], ".png", "") , x, y, w, h).hit then
      table.remove(charactersDrawTable, count)
      table.insert(charactersDrawTable, count, charactersTable[count])
  end
  
 
 
  fontSize = 18
  
  if suit.Button ("Shut"..tostring(count), x + 100, y + 8, w / 2, h / 2).hit then
          for k in pairs(charactersDrawTable) do
            charactersDrawTable[count] = nil
          end
    end
    
  
    
  
  
end
