require "Classes/Managers/uiManager"
require "Classes/Managers/artManager"
require "Classes/Managers/musicAndSoundsManager"
require "Classes/LightMaps/light"
require "Classes/Online/send_receive"

socket = require "socket"
address, port = "192.168.1.55", 12345
udp = socket.udp()
udp:setpeername(address, port)
udp:settimeout(0)

screenWidth, screenHeight = love.graphics.getDimensions()
screenPartsWidth =  screenWidth / 4
screenPartsHeight = screenHeight / 4



function love.load()
 
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  
  art = ArtManager()
  
  musicAndSounds = MusicManager()

  ui = Ui()
  
  lightMap = LightMap()
  
  serverLink = ServerClient()

end

function love.update(dt)

  --mouseX, mouseY = love.mouse.getPosition()
  
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
  
  serverLink:update()
  
  art:update(dt)
  
  lightMap:update()
  
  musicAndSounds:update()
  
  ui:update()
  
end

function love.draw()
  
  art:draw()
  
  lightMap:draw()
  
  ui:draw()
  
  serverLink:draw()
end


function GetImageScaleForNewDimensions(Sprite, newWidth, newHeight)
    local currentWidth, currentHeight = Sprite:getDimensions()
    return ( newWidth / currentWidth ), ( newHeight / currentHeight )
end






 