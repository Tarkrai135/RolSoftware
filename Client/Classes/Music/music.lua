Object = require "Libs/classic"
Music = Object:extend()

musicVolume = 0.5

function Music:new(song)
  
  self.song = love.audio.newSource("Assets/music/"..song, "stream")
  
 
end

function Music:update()
  
  self.song:setVolume(musicVolume)
  
end


function Music:startPlay()
  self.song:play()
end

function Music:stopPlay()
  self.song:stop()
end



