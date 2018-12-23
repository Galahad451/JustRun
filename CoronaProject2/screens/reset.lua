
local composer = require( "composer" )
local xyManager = require( "system.xyManager" )
local loadsave = require("system.loadsave")
local gameData = require("system.gameData")
local uiManager = require("system.UIManager")
local fonts = require("system.fonts")

-- Character sheet
local hero = require("characters.player.hero")
local enemy = require("characters.enemies.enemy")
local patrones = require("characters.enemies.patrones")
local sounds = require("audio.data.audio")
local sprites = require("sprites.other.spritesManager")

-- Background sheet
local background = require("sprites.background.background")

-- Load Physics
local physics = require( "physics" )

local scene = composer.newScene()

local velocity = 1
local replay

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local function parallax()
	background.setVel(velocity)
	background.parallax()
end

local function showScore(group)
	uiManager.spawnReplay(group)
	uiManager.displayGreenBox(group, xyManager.centreX(0), xyManager.centreY(0))
	local scoreText = display.newEmbossedText( uiGroup, "Score: " .. gameData.persistent.score, xyManager.centreX(0), xyManager.centreY(0), fonts.main, 36 )
	local color = { 
		highlight = {r = 0, g = 0, b = 0, a = 0.5}, 
		shadow = {r = 0, g = 0, b = 0, a = 0.5}
	}

	uiManager.displayGreenBox(group, xyManager.centreX(0), xyManager.centreY(-200))
	local scoreText = display.newEmbossedText( uiGroup, "Max Score: " .. gameData.persistent.highScore, xyManager.centreX(0), xyManager.centreY(-200), fonts.main, 36 )
	local color = { 
		highlight = {r = 0, g = 0, b = 0, a = 0.5}, 
		shadow = {r = 0, g = 0, b = 0, a = 0.5}
	}
	
	scoreText:setFillColor( 1, 1, 1 )
	scoreText:setEmbossColor( color )
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	score = 0
	level = 1
	velocity = 1
	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	backGroup = display.newGroup()
	sceneGroup: insert(backGroup)

	mainGroup = display.newGroup()
	sceneGroup: insert(mainGroup)

	uiGroup = display.newGroup()
	sceneGroup: insert(uiGroup)

	background.toBack()
	background.startVel(velocity)

	if (gameData.persistent.highScore < gameData.persistent.score) then
		gameData.persistent.highScore = gameData.persistent.score
		showScore(uiGroup)
	else
		showScore(uiGroup)
	end
	
		 
	-- Add the key event listener
	
	Runtime:addEventListener( "enterFrame", parallax )
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)
		physics.pause()

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

		composer.removeScene("screens.reset")


	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
	Runtime:removeEventListener( "enterFrame", parallax )

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene