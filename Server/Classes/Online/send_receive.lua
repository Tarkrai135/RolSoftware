Object = require "Libs/classic"
ServerClient = Object:extend()

require "Classes/Managers/uiManager"
require "Classes/Managers/artManager"
require "Classes/Managers/musicAndSoundsManager"
require "Classes/LightMaps/light"

sendCharacterSelected = 0
characterClicked = false
characterDeleted = false
deleteAllCharacters = false

sendItemSelected = 0

sendMusicPlaying = 0
sendMusicStop = false

sendAmbientSelected = 0
sendAmbientPlay = false
sendAmbientStop = false

sendSoundFolder = 0
sendSoundSelected = 0
sendSoundPlay = false

sendTime = 0

function ServerClient:new()
  
  self.light = LightMap()
  
end

function ServerClient:update()
  
  self.light:update()
  
  if characterClicked == true then
    sendTime = sendTime + 1
    if sendTime > 1 then
        characterClicked  = false
        sendTime= 0
    end
  end  
  
  if characterDeleted == true then
    sendTime = sendTime + 1
    if sendTime > 1 then
        characterDeleted  = false
        sendTime= 0
    end
  end 
  
   if deleteAllCharacters == true then
    sendTime = sendTime + 1
    if sendTime > 1 then
        deleteAllCharacters  = false
        sendTime= 0
    end
  end 
  
  if sendMusicStop == true then
    sendTime = sendTime + 1
    if sendTime > 1 then
        sendMusicStop  = false
        sendTime= 0
    end
  end 
  
  if sendAmbientPlay == true then
    sendTime = sendTime + 1
    if sendTime > 1 then
        sendAmbientPlay  = false
        sendTime= 0
    end
  end 
  
  if sendAmbientStop == true then
    sendTime = sendTime + 1
    if sendTime > 1 then
        sendAmbientStop  = false
        sendTime= 0
    end
  end 
  
  if sendSoundPlay == true then
    sendTime = sendTime + 1
    if sendTime > 1 then
        sendSoundPlay  = false
        sendTime= 0
    end
  end 
  
  
 
  
  dataReceived, msg_or_ip, port_or_nil = udp:receivefrom()
	
	if dataReceived then
    
		udp:sendto(tostring(mouseX)..'-'..tostring(mouseY)..'-'..
tostring(self.light.drawMap)..'-'..tostring(self.light.resetShadow)..'-'..tostring(self.light.click)..'-'..tostring(self.light.lightSize)..'-'..
tostring(mapDisplay)..'-'..tostring(locationsDisplay)..'-'..
tostring(sendCharacterSelected)..'-'..tostring(characterClicked)..'-'..tostring(characterDeleted)
..'-'..tostring(deleteAllCharacters)..'-'..tostring(sendItemSelected)..'-'..tostring(sendMusicPlaying)..'-'..tostring(sendMusicStop)..'-'..tostring(sendAmbientSelected)..'-'..tostring(sendAmbientPlay)..'-'..tostring(sendAmbientStop)..'-'..tostring(sendSoundFolder)..'-'..tostring(sendSoundSelected)..'-'..tostring(sendSoundPlay), msg_or_ip, port_or_nil)
    
  end
  
end

function ServerClient:draw()
  --love.graphics.print(tostring(sendCharacterPositionY),300,50)
  self.light:draw()
end


function split(s, delimiter)
	result = {}
	for match in (s..delimiter):gmatch("(.-)"..delimiter) do
		table.insert(result, match)
	end
	return result
end