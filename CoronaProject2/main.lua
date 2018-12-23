local composer = require( "composer" )
local loadsave = require("system.loadsave")
local gameData = require("system.gameData")
local background = require("sprites.background.background")
local physics = require("physics")
local sounds = require("audio.data.audio")

--Initialize Physics

physics.start( true )
physics.setGravity( 0, 9.8 )

-- Hide status bar
display.setStatusBar( display.HiddenStatusBar )

-- Seed the random number generator
math.randomseed( os.time() )

audio.reserveChannels( 3 )

gameData.persistent = loadsave.loadTable("gameData.json")

if gameData.persistent == nil then
	gameData.persistent = gameData.persistentDefault
	loadsave.saveTable( gameData.persistent, "gameData.json")
end

audio.setVolume( gameData.persistent.FX , {channel=2} ) -- FX
audio.setVolume( gameData.persistent.FX , {channel=3} ) -- FX2
audio.setVolume( gameData.persistent.audio , {channel=1} ) -- Audio

background.spawn()
background.start()
background.startVel(1)

composer.gotoScene( "screens.menu" )