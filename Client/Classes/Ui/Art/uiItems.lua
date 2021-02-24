Object = require "Libs/classic"
UiItems = Object:extend()

suit = require "Libs/suit-master"

itemsDrawTable = {}

function UiItems:new()
  
  self.w = screenPartsWidth / 4.8
  self.h = screenPartsHeight / 9
  
  self.itemsX = screenWidth / 1.0766
  self.itemsY = screenPartsHeight / 5.4
  
end

function UiItems:update()
  
  UiItems:SetItems(self.itemsX, self.itemsY, self.w, self.h)
  
end

function UiItems:draw()
   
  UiItems:DrawItems()
  
end

function UiItems:SetItems(x, y, w, h)
  
  local count = 1 

  if suit.Button("Items", x, y, w, h).hit then
    itemsImage = true
  end
  
  if itemsImage then
    
    y = y + 30
    
    for k,v in pairs(itemsTable) do
      
      UiItems:AddItems(x,y,w,h,count)
    
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
    
    if suit.Button("Close Items", x, y, w, h).hit then
      itemsImage = false
    end
    
  end
    
end

function UiItems:AddItems(x,y,w,h,count)
  
  
  if suit.Button(string.gsub(itemsFolder[count], ".png", "") , x, y, w, h).hit then
      table.remove(itemsDrawTable, count)
      table.insert(itemsDrawTable, count, itemsTable[count])
  end
  
  if suit.Button ("Shut".." "..tostring(count).."   ", x + 100, y + 8, w / 2, h / 2).hit then
          for k in pairs(itemsDrawTable) do
            itemsDrawTable[count] = nil
          end
    end
  
end

function UiItems:DrawItems()
  
  for k,v in pairs(itemsDrawTable) do
    v:draw()
  end

end