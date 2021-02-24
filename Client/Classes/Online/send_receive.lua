Object = require "Libs/classic"
ServerClient = Object:extend()

require "Classes/Managers/uiManager"
require "Classes/Managers/artManager"
require "Classes/Managers/musicAndSoundsManager"
require "Classes/LightMaps/light"

function ServerClient:new()
  
  
  
end

function ServerClient:update()
  
  udp:send("")
  
	dataReceived = udp:receive()
  
	if dataReceived then
		local p = split(dataReceived, '-')
    
		mouseX, mouseY, drawLightMap, resetLightMap, click, lightSize, mapDisplay, locationsDisplay, characterSelected, characterClicked, characterDeleted, deleteAllCharacters, itemSelected, musicPlaying, stopMusic, ambientSelected, ambientPlay, ambientStop, soundFolder, soundSelected, soundPlay = p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15], p[16], p[17], p[18], p[19], p[20], p[21]
  end

  mapDisplay = tonumber(mapDisplay)
  locationsDisplay = tonumber(locationsDisplay)
  characterSelected = tonumber(characterSelected)
  itemSelected = tonumber(itemSelected)
  musicPlaying = tonumber(musicPlaying)
  ambientSelected = tonumber(ambientSelected)
  soundFolder = tonumber(soundFolder)
  soundSelected = tonumber(soundSelected)
  
  
end

function ServerClient:draw()
  love.graphics.print(tostring(characterSelected),300,0)
end



function split(s, delimiter)
	result = {}
	for match in (s..delimiter):gmatch("(.-)"..delimiter) do
		table.insert(result, match)
	end
	return result
end