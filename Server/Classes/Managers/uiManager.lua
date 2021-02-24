Object = require "Libs/classic"
Ui = Object:extend()

require "Classes/Ui/Art/uiMaps"
require "Classes/Ui/Art/uiLocations"
require "Classes/Ui/Art/uiCharacters"
require "Classes/Ui/Art/uiItems"

require "Classes/Ui/Music/uiMusic"
require "Classes/Ui/Music/uiAmbientSounds"
require "Classes/Ui/Music/uiSounds"

suit = require "Libs/suit-master"




function Ui:new()
  
  mainFont = love.graphics.newFont("Assets/fonts/inquisition.ttf", 15)
  love.graphics.setFont(mainFont)
  
  suit.theme.color.normal.fg = {255,255,255}
  suit.theme.color.hovered = {bg = {255,0,0,0.5}, fg = {255,255,0}}
  suit.theme.color.active = {bg = {255,255,255}, fg = {255,0,0,0.8}}
  
  self.uiRectangle = love.graphics.newImage("assets/UiBox.png")
  self.recW, self.recH = GetImageScaleForNewDimensions(self.uiRectangle, screenPartsWidth, screenHeight)
  
  self.whiteRectangleX = 0
  self.whiteRectangleY = 0
  
  
  maps = UiMaps()
  characters = UiCharacters()
  locations = UiLocations()
  items = UiItems()
  
  musicUi = UiMusic()
  ambientUi = UiAmbientSounds()
  soundsUi = UiSounds()
  
end

function Ui:update()
  
 
  
  maps:update()
  characters:update()
  locations:update()
  items:update()
  
  musicUi:update()
  ambientUi:update()
  soundsUi:update()
  
end


function Ui:draw()
  
    --love.graphics.rectangle("fill", self.whiteRectangleX, self.whiteRectangleY, screenWidth, screenHeight)
  
  love.graphics.draw(self.uiRectangle, screenPartsWidth*3 -2, 0, 0 , self.recW+0.01, self.recH)
 
  maps:draw()
  characters:draw()
  locations:draw()
  items:draw()
  
  
 
  suit.draw()
  
   
end




