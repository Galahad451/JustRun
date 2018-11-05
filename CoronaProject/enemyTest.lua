
local composer = require( "composer" )
local xyManager = require("xyManager")
local enemy = require("game.enemy")

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local sheetInfo = require("Sprites.enemyData")
local myImageSheet = graphics.newImageSheet( "Sprites/enemySheet.png", sheetInfo:getSheet() )

local sequenceData = {
	{name = "Red", frames = {1}},
	{name = "Yellow", frames = {2}},
	--{name = "greenDragon", start = 3, count = 6, time = 400, loopCount = 0, loopDirection = "forward"},
	{name = "greenDragon", frames = {3, 5}, time = 300, loopCount = 0, loopDirection = "forward"},
	{name = "redDragon", start = 9, count = 6, time = 300, loopCount = 0, loopDirection = "forward"},
}

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
	enemy.create(1, 4)

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

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

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
