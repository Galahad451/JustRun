local composer = require( "composer" )
local loadsave = require("system.loadsave")
local gameData = require("system.gameData")
local background = require("game.background")
local physics = require("physics")

--Initialize Physics

physics.start( true )
physics.setGravity( 0, 9.8 )

-- Hide status bar
display.setStatusBar( display.HiddenStatusBar )

-- Seed the random number generator
math.randomseed( os.time() )

audio.reserveChannels( 2 )

audio.setVolume( 1 , {channel=2} )

gameData.persistent = loadsave.loadTable("gameData.json")

if gameData.persistent == nil then
	gameData.persistent = gameData.persistentDefault
	loadsave.saveTable( gameData.persistent, "gameData.json")
end

background.spawn()
background.start()
background.startVel(1)

composer.gotoScene( "game" )