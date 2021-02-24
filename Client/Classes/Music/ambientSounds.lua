Object = require "Libs/classic"
AmbientSounds = Object:extend()

ambientSoundsVolume = 0.5


function AmbientSounds:new(ambientSound)
  
  self.ambientSound = love.audio.newSource("Assets/ambient sounds/"..ambientSound, "stream")
  
 
end

function AmbientSounds:update()
  
 
  self.ambientSound:setVolume(ambientSoundsVolume)
  
  
end

function AmbientSounds:startPlay()
  self.ambientSound:play()
end

function AmbientSounds:stopPlay()
  self.ambientSound:stop()
end