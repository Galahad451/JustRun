local sounds = {}

local gameData = require("system.gameData")

sounds.bubble = audio.loadSound( "audio/files/bubble.wav" )
sounds.attack = audio.loadSound( "audio/files/attack.wav" )
sounds.death = audio.loadSound( "audio/files/death.wav" )
sounds.step = audio.loadSound( "audio/files/step.wav" )
sounds.menu = audio.loadStream( "audio/files/loop.wav" )
sounds.game = audio.loadStream( "audio/files/game.wav" )
sounds.down = audio.loadSound( "audio/files/down.wav" )
sounds.jump = audio.loadSound( "audio/files/jump.wav" )
sounds.speedUp = audio.loadSound( "audio/files/speedUp.wav" )
sounds.destroyWood = audio.loadSound( "audio/files/destroyWood.mp3" )


return sounds