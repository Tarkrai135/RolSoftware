Object = require "Libs/classic"
Sounds = Object:extend()

soundsVolume = 0.5
playSound = true

function Sounds:new(sound)
  
  self.sound = love.audio.newSource("Assets/sounds/"..sound, "static")
  
 
end

function Sounds:update()
  --[[
  if playSound then
    self.sound:play()
    playSound = false
  end
  --]]
  love.audio.setVolume(soundsVolume)  
  
end

function Sounds:playSound()
  self.sound:play()
end