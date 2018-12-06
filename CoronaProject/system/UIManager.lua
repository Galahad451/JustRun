local uiManager = {}

local composer = require("composer")

local xyManager = require("system.xyManager")
local loadsave = require("system.loadsave")
local gameData = require("system.gameData")
local hero = require("game.hero")
local movement = require("system.movement")

local popUps = require("game.popUps")

local background = require("game.background")

local sheetInfo = require("system.UIData")
local myImageSheet = graphics.newImageSheet( "system/UISheet.png", sheetInfo:getSheet() )

local sequenceData = {
	{ name = "audio", 		frames = { 1 , 3 , 5 , 7} },
	{ name = "audioNull", 	frames = { 2 , 4 , 6 , 8} },
	{ name = "FX", 			frames = { 11 , 13, 15, 17} },
	{ name = "FXNull", 		frames = { 12, 14, 16, 18} },
	{ name = "heart", 		frames = { 15, 16, 18, 18} },
	{ name = "skin", 		frames = { 67, 69, 71, 30} },
	{ name = "records", 	frames = { 46, 48, 50, 51} },
	{ name = "play", 		frames = { 41, 43, 44, 45} }
}

local audioButton
local FXButton
local skinButton
local recordsButton
local playButton

local function setVisible(value)
	if (value == true) then
		audioButton.isVisible = true
		FXButton.isVisible = true
		recordsButton.isVisible = true
		skinButton.isVisible = true
	else
		audioButton.isVisible = false
		FXButton.isVisible = false
		recordsButton.isVisible = false
		skinButton.isVisible = false
	end
end

local function setAudio()
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
end

local function setFX()
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
end
--[[
local function changeSkin()
	gameData.persistent.skin = gameData.persistent.skin + 1
	if gameData.persistent.skin >= 5 then
		gameData.persistent.skin = 1
	end

	audioButton:setFrame( gameData.persistent.skin )
	FXButton:setFrame( gameData.persistent.skin )
	skinButton:setFrame( gameData.persistent.skin )
	recordsButton:setFrame( gameData.persistent.skin )
	playButton:setFrame( gameData.persistent.skin )
	
	background.changeSkin()
	hero.changeSkin()

	loadsave.saveTable(gameData.persistent, "gameData.json")
end
]]
local function changeSkin()
	popUps.spawnCredits()
end

local function gotoGame(event)
	local function startGame() composer.gotoScene( "game", {time = 0, effect = "crossFade"} ) end
	local function startPhase() transition.to( playButton, {time = 100, xScale = 1.3, yScale = 1.3, onComplete = endPhase } ) end
	local function endPhase() transition.to( playButton, {time = 100, xScale = 1, yScale = 1, onComplete = startGame} ) end
	if (event.phase == "began") then
		startPhase()
	end
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

	skinButton = display.newSprite( group, myImageSheet, sequenceData )
	skinButton:setSequence( "skin" )
	skinButton:setFrame( gameData.persistent.skin )
	skinButton.x = xyManager.centreX(550)
	skinButton.y = 3*(xyManager.contentHeight-50)/4-80
	skinButton:addEventListener( "tap", changeSkin )

	recordsButton = display.newSprite( group, myImageSheet, sequenceData )
	recordsButton:setSequence( "records" )
	recordsButton:setFrame( gameData.persistent.skin )
	recordsButton.x = xyManager.centreX(550)
	recordsButton.y = 4*(xyManager.contentHeight-50)/4-80

	playButton = display.newSprite( group, myImageSheet, sequenceData )
	playButton:setSequence( "play" )
	playButton:setFrame( gameData.persistent.skin )
	playButton.x = xyManager.centreX(0)
	playButton.y = xyManager.centreY(0)
	playButton:addEventListener( "touch", gotoGame )
	movement.breath(playButton, 0.05, 300)
end

uiManager.spawn = spawn
uiManager.changeSkin = changeSkin
uiManager.setVisible = setVisible
uiManager.wiggle = wiggle


return uiManager
	
