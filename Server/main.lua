require "Classes/Managers/uiManager"
require "Classes/Managers/artManager"
require "Classes/Managers/musicAndSoundsManager"
require "Classes/LightMaps/light"
require "Classes/Online/send_receive"

socket = require('socket')
udp = socket.udp()
udp:setsockname('25.111.13.237', 12345)
udp:settimeout(0)


screenWidth, screenHeight = love.graphics.getDimensions()
screenPartsWidth =  screenWidth / 4
screenPartsHeight = screenHeight / 4



function love.load()
 
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  
  art = ArtManager()
  
  musicAndSounds = MusicManager()
  
  lightMap = LightMap()

  ui = Ui()
  
  serverLink = ServerClient()

end

function love.update(dt)
  
  mouseX, mouseY = love.mouse.getPosition()
  
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
  
  art:update(dt)
  
  musicAndSounds:update()
  
  lightMap:update()
  
  serverLink:update()
  
  ui:update()
  
  
  
end

function love.draw()
  
  art:draw()
  
  lightMap:draw()
  
  serverLink:draw()
  
  ui:draw()
  
  love.graphics.print("Press N to show/hide the map and M to reset the shadows", screenPartsWidth * 3 + 22, 15)
  
  
end


function GetImageScaleForNewDimensions(Sprite, newWidth, newHeight)
    local currentWidth, currentHeight = Sprite:getDimensions()
    return ( newWidth / currentWidth ), ( newHeight / currentHeight )
end



 