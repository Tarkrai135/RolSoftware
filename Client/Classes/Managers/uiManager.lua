Object = require "Libs/classic"
Ui = Object:extend()

suit = require "Libs/suit-master"




function Ui:new()
  
  mainFont = love.graphics.newFont("Assets/fonts/inquisition.ttf", 15)
  love.graphics.setFont(mainFont)
  
   suit.theme.color.normal.fg = {255,255,255}
  suit.theme.color.hovered = {bg = {255,0,0,0.5}, fg = {255,255,0}}
  suit.theme.color.active = {bg = {255,255,255}, fg = {255,0,0,0.8}}
  
 
  self.uiRectangle = love.graphics.newImage("assets/UiBox.png")
  self.recW, self.recH = GetImageScaleForNewDimensions(self.uiRectangle, screenPartsWidth, screenHeight)
  


  
  
end

function Ui:update()
  
   if suit.Button("Volume Up", generalVolumeUpX, generalVolumeUpY,generalVolumeUpW, generalVolumeUpH).hit then
      
      generalVolume = generalVolume + 0.1
      
    end
    
     if suit.Button("Volume Down", generalVolumeDownX, generalVolumeDownY,generalVolumeUpW, generalVolumeUpH).hit then
      
      generalVolume = generalVolume - 0.1
      
    end


  
  
end


function Ui:draw()
  
  
  love.graphics.draw(self.uiRectangle, screenPartsWidth*3 -2, 0, 0 , self.recW+0.01, self.recH)
  
  suit.draw()
  
end



