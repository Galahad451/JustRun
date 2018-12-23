local uiManager = {}

local composer = require("composer")

local xyManager = require("system.xyManager")
local loadsave = require("system.loadsave")
local gameData = require("system.gameData")
local hero = require("characters.player.hero")
local movement = require("system.movement")
local sounds = require("audio.data.audio")

local popUps = require("system.popUps")

local background = require("sprites.background.background")

local sheetInfo = require("sprites.UIData")
local myImageSheet = graphics.newImageSheet( "sprites/UISheet.png", sheetInfo:getSheet() )

local sequenceData = {
	{ name = "audio", 		frames = { 7 , 7 , 7 , 7} },
	{ name = "audioNull", 	frames = { 8 , 8 , 8 , 8} },
	{ name = "FX", 			frames = { 17 , 17, 17, 17} },
	{ name = "FXNull", 		frames = { 18, 18, 18, 18} },
	{ name = "heart", 		frames = { 15, 16, 18, 18} },
	{ name = "info", 		frames = { 31, 31, 31, 31} },
	{ name = "records", 	frames = { 52, 52, 52, 52} },
	{ name = "play", 		frames = { 46, 46, 46, 46} },
	{ name = "replay", 		frames = {57, 57, 57, 57}},
	{ name = "greenBox", frames = {19}},
	{ name = "home", frames = {30,30,30,30}},
	{ name = "pause", frames = {41}}
}

local greenBox

local function displayGreenBox(group, x, y)
	greenBox = display.newSprite( group, myImageSheet, sequenceData )
	greenBox:setSequence( "greenBox" )
	greenBox.x = x
	greenBox.y = y
end

local audioButton
local FXButton
local infoButton
local recordsButton
local playButton
local replayButton
local homeButton
local pauseButton

local function setVisible(value)
	if (value == true) then
		audioButton.isVisible = true
		FXButton.isVisible = true
		recordsButton.isVisible = true
		infoButton.isVisible = true
	else
		audioButton.isVisible = false
		FXButton.isVisible = false
		recordsButton.isVisible = false
		infoButton.isVisible = false
	end
end

local function setAudio()
	audio.play( sounds.bubble, { channel = 2 } )
	local function changeAudio()
		if gameData.persistent.audio == 1 then
			gameData.persistent.audio = 0
			audioButton:setSequence( "audioNull" )
			audioButton:setFrame( gameData.persistent.skin )
		else
			gameData.persistent.audio = 1
			audioButton:setSequence( "audio" )
			audioButton:setFrame( gameData.persistent.skin )
		end
		loadsave.saveTable(gameData.persistent, "gameData.json")
		audio.setVolume( gameData.persistent.audio, {channel = 1} )
	end
	movement.push( audioButton, changeAudio )
	
end

local function setFX()
	local function changeFX()
		if gameData.persistent.FX == 1 then
			gameData.persistent.FX = 0
			FXButton:setSequence( "FXNull" )
			FXButton:setFrame( gameData.persistent.skin )
		else
			gameData.persistent.FX = 1
			FXButton:setSequence( "FX" )
			FXButton:setFrame( gameData.persistent.skin )
		end
		loadsave.saveTable(gameData.persistent, "gameData.json")
		audio.setVolume( gameData.persistent.FX, {channel = 2} )
		audio.setVolume( gameData.persistent.FX, {channel = 3} )
	end
	movement.push( FXButton, changeFX )
	audio.play( sounds.bubble, {channel = 2 })
	
end

local function showInfo()
	audio.play( sounds.bubble, {channel = 2 })
	local function startGame()
		popUps.spawnCredits()
	end
	movement.push( infoButton, startGame )
end

local function showRecords()
	audio.play( sounds.bubble, {channel = 2 })
	movement.push( recordsButton, "" )
end

local function gotoMenu()
	audio.play( sounds.bubble, {channel = 2 })
	audio.stop( {channel = 1} )
	audio.play( sounds.menu , {channel = 1, loops = -1} )
	audio.rewind( {channel = 1} )
	local function startGame() 
		composer.gotoScene( "screens.menu", {time = 0, effect = "crossFade"} ) 
	end
	movement.push( homeButton, startGame )
end


local function gotoGame()
	audio.play( sounds.bubble, {channel = 2 })
	audio.stop( {channel = 1} )
	audio.play( sounds.game , {channel = 1, loops = -1} )
	audio.rewind( {channel = 1} )
	local function startGame() 
		composer.gotoScene( "screens.game", {time = 0, effect = "crossFade"} ) 
	end
	movement.push( playButton, startGame )
end


local function spawn(group)
	audioButton = display.newSprite( group, myImageSheet, sequenceData )
	if gameData.persistent.audio == 1 then
		audioButton:setSequence( "audio" )
	else
		audioButton:setSequence( "audioNull" )
	end
	audioButton:setFrame( gameData.persistent.skin )
	table.insert( uiManager, audioButton )
	audioButton.x = xyManager.centreX(550)
	audioButton.y = (xyManager.contentHeight-50)/4-80
	audioButton:addEventListener( "tap", setAudio )

	FXButton = display.newSprite( group, myImageSheet, sequenceData )
	if gameData.persistent.FX == 1 then
		FXButton:setSequence( "FX" )
	else
		FXButton:setSequence( "FXNull" )
	end
	FXButton:setFrame( gameData.persistent.skin )
	table.insert( uiManager, FXButton )
	FXButton.x = xyManager.centreX(550)
	FXButton.y = 2*(xyManager.contentHeight-50)/4-80
	FXButton:addEventListener( "tap", setFX )

	infoButton = display.newSprite( group, myImageSheet, sequenceData )
	infoButton:setSequence( "info" )
	infoButton:setFrame( gameData.persistent.skin )
	infoButton.x = xyManager.centreX(550)
	infoButton.y = 3*(xyManager.contentHeight-50)/4-80
	infoButton:addEventListener( "tap", showInfo )

	recordsButton = display.newSprite( group, myImageSheet, sequenceData )
	recordsButton:setSequence( "records" )
	recordsButton:setFrame( gameData.persistent.skin )
	recordsButton.x = xyManager.centreX(550)
	recordsButton.y = 4*(xyManager.contentHeight-50)/4-80
	recordsButton:addEventListener( "tap", showRecords )

	playButton = display.newSprite( group, myImageSheet, sequenceData )
	playButton:setSequence( "play" )
	playButton:setFrame( gameData.persistent.skin )
	playButton.x = xyManager.centreX(0)
	playButton.y = xyManager.centreY(0)
	playButton:addEventListener( "tap", gotoGame )
	movement.breath(playButton, 0.05, 300)
end

local function spawnReplay(group)
	replayButton = display.newSprite( group, myImageSheet, sequenceData )
	replayButton:setSequence( "replay" )
	replayButton:setFrame( gameData.persistent.skin )
	replayButton.x = xyManager.centreX(0)
	replayButton.y = xyManager.centreY(200)
	replayButton:addEventListener( "tap", gotoGame )
	movement.breath(replayButton, 0.05, 300)

	homeButton = display.newSprite( group, myImageSheet, sequenceData )
	homeButton:setSequence( "home" )
	homeButton:setFrame( gameData.persistent.skin )
	homeButton.x = xyManager.centreX(300)
	homeButton.y = xyManager.centreY(-200)
	homeButton:addEventListener( "tap", gotoMenu )
end

local function spawnPauseButton(group)
	pauseButton = display.newSprite( group, myImageSheet, sequenceData )
	pauseButton:setSequence( "pause" )
	pauseButton:setFrame( gameData.persistent.skin )
	pauseButton.x = xyManager.centreX(0)
	pauseButton.y = xyManager.centreY(-340)
	return pauseButton
end


uiManager.spawn = spawn
uiManager.changeSkin = changeSkin
uiManager.setVisible = setVisible
uiManager.displayGreenBox = displayGreenBox
uiManager.spawnReplay = spawnReplay
uiManager.pauseButton = spawnPauseButton


return uiManager
	
