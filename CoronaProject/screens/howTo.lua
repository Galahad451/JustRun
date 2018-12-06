
local composer = require( "composer" )
local xyManager = require( "system.xyManager" )
local hero = require("game.hero")
local background = require("game.background")

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

	hero.spawn(mainGroup)
	hero.walk()

	background.spawn(backGroup)

	local square = display.newRect(backuiGroup, 0,0,display.contentWidth, display.contentHeight)
	square:setFillColor(0,0,0,0.5)
	square.x = xyManager.centreX(0)
	square.y = xyManager.centreY(0)

	local contentSquare = display.newRect(uiGroup, 0, 0, 600, 600)
	contentSquare.x = xyManager.centreX(0)
	contentSquare.y = xyManager.centreY(0)
	contentSquare:setFillColor(.28,.08,.13)

	display.newText(uiGroup, "J       JUMP", xyManager.centreX(0), xyManager.centreY(0)-100, "Orientalismus.otf", 40)
	display.newText(uiGroup, "J       DOWN", xyManager.centreX(0), xyManager.centreY(0), "Orientalismus.otf", 40)
	display.newText(uiGroup, "Z       ATTACK", xyManager.centreX(0), xyManager.centreY(0)+100, "Orientalismus.otf", 40)

	local returnButton = display.newImageRect(uiGroup, "buttons/return.png", 60, 60)
	returnButton.x = xyManager.centreX(-550)
	returnButton.y = 50

	returnButton:addEventListener("tap", gotoMenu)
	Runtime:addEventListener("enterFrame", parallax )

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
	Runtime:removeEventListener("enterFrame", parallax )

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
