local composer = require( "composer" )
local uiManager = require("system.UIManager")
local xyManager = require("system.xyManager")
local hero = require("characters.player.hero")
local background = require("sprites.background.background")
local gameData = require("system.gameData")
local loadsave = require("system.loadsave")
local physics = require("physics")
local popUps = require("system.popUps")
local fonts = require("system.fonts")
local sounds = require("audio.data.audio")



local scene = composer.newScene()

local play

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

--Start physics
physics.start( true )
physics.setGravity( 0, 9.8 )
physics.setDrawMode( "normal" )

local function enterGame()
	composer.gotoScene( "screens.game", {time = 1, effect = "crossFade"} )
end

local function gotoSettings()
	composer.gotoScene( "screens.settings", {time = 800, effect = "crossFade"} )
end

local function gotoRanking()
	composer.gotoScene( "screens.ranking", {time = 800, effect = "crossFade"} )
end

local function gotoSkins()
	uiManager.changeSkin()
end

local function gotoHowTo()
	composer.gotoScene("screens.howTo", {time = 800, effect = "crossFade"} )
end

local score = 0
local puntos = {}


local function loop()
	score.text = gameData.persistent.highScore
	background.parallax()
	background.setVel(1)
	uiManager.setVisible(popUps.creditsFlag)
end


local heroWidth = 50


local uiGroup
local mainGroup
local backGroup 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	backGroup = display.newGroup()
	sceneGroup:insert( backGroup )

	mainGroup = display.newGroup()
	sceneGroup:insert( mainGroup )

	uiGroup = display.newGroup()
	sceneGroup:insert( uiGroup )

	background.toBack()
	uiManager.spawn(uiGroup)

	uiManager.displayGreenBox(uiGroup, xyManager.centreX(0), xyManager.centreY(-320))
	audio.play(sounds.menu, {channel = 1, loops = -1})

	-- Code here runs when the scene is first created but has not yet appeared on screen
	puntos = loadsave.loadTable("gameData.json", system.DocumentsDirectory)

	local color = { highlight = {r=0,g=0,b=0, a=0.5}, shadow = {r=0,g=0,b=0,a=0.5}}

	local maxScore = display.newEmbossedText(uiGroup, "MAX SCORE", xyManager.centreX(0), xyManager.centreY(-340), fonts.main, 25)
	maxScore.x = xyManager.centreX(0)
	maxScore:setFillColor( 1, 1, 1 )
	maxScore:setEmbossColor( color )

	score = display.newEmbossedText(uiGroup, puntos.highScore, xyManager.centreX(0), xyManager.centreY(-305), fonts.main, 40)
	score.x = xyManager.centreX(0)
	score:setFillColor( 1, 1, 1 )
	score:setEmbossColor( color )

	Runtime:addEventListener("enterFrame", loop)


end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
		hero.spawn(mainGroup)
		hero.walk()
		timer.performWithDelay( 1000, audio.resume( sounds.menu ), 1 )
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
		composer.removeScene("screens.menu")
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
	Runtime:removeEventListener("enterFrame", loop)

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
