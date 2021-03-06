
local composer = require( "composer" )
local xyManager = require( "system.xyManager" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------


local backGroup
local mainGroup
local backuiGroup
local uiGroup


local heroWidth = 50

local function gotoMenu()
	composer.gotoScene("menu", {time = 800, effect = "crossFade"} )
end

local function parallax()
	background.parallax()
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	backGroup = display.newGroup()
	sceneGroup:insert( backGroup )

	mainGroup = display.newGroup()
	sceneGroup:insert( mainGroup )

	backuiGroup = display.newGroup()
	sceneGroup:insert( backuiGroup )

	uiGroup = display.newGroup()
	sceneGroup:insert( uiGroup )

	local background = display.newImageRect(backGroup, "background.png", display.contentWidth, display.contentHeight)
	background.x = xyManager.centreX(0)
	background.y = xyManager.centreY(0)

	local square = display.newRect(backuiGroup, 0,0,display.contentWidth, display.contentHeight)
	square:setFillColor(0,0,0,0.5)
	square.x = xyManager.centreX(0)
	square.y = xyManager.centreY(0)

	local contentSquare = display.newRect(uiGroup, display.contentWidth/2-100, display.contentHeight/2-100, 200, 200)
	contentSquare.x = xyManager.centreX(0)
	contentSquare.y = xyManager.centreY(0)
	contentSquare:setFillColor(.28,.08,.13)

	local returnButton = display.newImageRect(uiGroup, "buttons/return.png", 30, 30)
	returnButton.x = 50
	returnButton.y = 50

	local hero = display.newImageRect( mainGroup, "characters/hero.png", heroWidth, heroWidth*1.51)
	hero.x = 50
	hero.y = xyManager.contentHeight-65

	returnButton:addEventListener("tap", gotoMenu)

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
