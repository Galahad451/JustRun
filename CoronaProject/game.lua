
local composer = require( "composer" )
local xyManager = require( "xyManager" )
local loadsave = require("system.loadsave")
local gameData = require("system.gameData")

-- Character sheet
local hero = require("game.hero")
local enemy = require("game.enemy")
local patrones = require("game.patrones")
local sword = require("game.sword")

-- Background sheet
local background = require("game.background")

-- Load Physics
local physics = require( "physics" )

local scene = composer.newScene()

local scoreText

local puntos = {}

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

--Variables
local jumpFlag = false
local swordFlag = false
local heroLive = true
local score
local swordTimer


physics.start( true )
physics.setGravity( 0, 9.8 )
--physics.setScale( 30 )
physics.setDrawMode( "normal" )

local function parallax()
	background.parallax()
end

local function loop()
	patrones.frames(mainGroup)
end

local function setScore()
	score = score + 1
	scoreText.text = "Score: " .. score
end

local function endGame()
	--[[local square = display.newRect(0,0,display.contentWidth, display.contentHeight)
	square:setFillColor(0,0,0,0.5)
	square.x = xyManager.centreX(0)
	square.y = xyManager.centreY(0)
	patrones.delete()
	hero.delete()
	display.newText( "GAMEOVER", xyManager.centreX(0), xyManager.centreY(0), "Orientalismus.otf", 70, WHITE )
	display.newText( "Score:  " .. score, xyManager.centreX(0), xyManager.centreY(100), "Orientalismus.otf", 60, WHITE )]]
	patrones.delete()
	hero.delete()
	background.delete()
	if (puntos.variable.highScore ~= nil and puntos.variable.highScore < score) then
		print("SCORE " .. score)
		puntos.variable.highScore = score
		print("Nuevo HIGHSCORE " .. gameData.variable.highScore)
	end
	loadsave.saveTable(puntos, "gameData.json", system.DocumentsDirectory)
end

local function onCollision(event)
	local obj1 = event.object1
	local obj2 = event.object2

	--Colisión entre espada y enemigo
	if((obj1.myName == "sword" and obj2.myName == "enemyRed") or (obj1.myName == "enemyRed" and obj2.myName == "sword")) then
		if(obj2.myName == "enemyRed") then
			
			display.remove(obj2)
		else
			display.remove(obj1)
		end
		for i = #enemy, 1, -1 do
			if ( enemy[i] == obj1 or enemy[i] == obj2 ) then
				table.remove( enemy, i )
				break
			end
		end
		setScore()
	end
	if((obj1.myName == "sword" and obj2.myName == "greenDragon") or (obj1.myName == "greenDragon" and obj2.myName == "sword")) then
		if(obj2.myName == "greenDragon") then
			
			display.remove(obj2)
		else
			display.remove(obj1)
		end
		for i = #enemy, 1, -1 do
			if ( enemy[i] == obj1 or enemy[i] == obj2 ) then
				table.remove( enemy, i )
				break
			end
		end
		setScore()
	end

	--Colision de heroe con ememigo para el heroe MUERA
	if((obj1.myName == "enemyRed" and obj2.myName == "hero")
		or (obj1.myName == "hero" and obj2.myName == "enemyRed")
		or (obj1.myName == "enemyYellow" and obj2.myName == "hero")
		or (obj1.myName == "hero" and obj2.myName == "enemyYellow")
		or (obj1.myName == "greenDragon" and obj2.myName == "hero")
		or (obj1.myName == "hero" and obj2.myName == "greenDragon")
		or (obj1.myName == "redDragon" and obj2.myName == "hero")
		or (obj1.myName == "hero" and obj2.myName == "redDragon")) then
		heroLive = false
		composer.gotoScene("menu", {time = 800, effect = "crossFade"})
	end



	--Colision entre el suelo y el heroe para que cambie de animación
	if((obj1.myName == "hero" and obj2.myName == "floor") or 
		(obj1.myName == "floor" and obj2.myName == "hero")) then
		if ( event.phase == "began" ) then
			jumpFlag = false
			hero.walk()

		end
		if (event.phase == "ended") then
			jumpFlag = true

		end
	end
end

local function removeSword()
	sword.remove()
	swordFlag = false
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	score = 0

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	backGroup = display.newGroup()
	sceneGroup: insert(backGroup)

	mainGroup = display.newGroup()
	sceneGroup: insert(mainGroup)

	uiGroup = display.newGroup()
	sceneGroup: insert(uiGroup)

	hero.spawn(mainGroup)
	hero.start()
	hero.walk()
	patrones.spawnFrame(mainGroup)

	sword.spawn(mainGroup)
	sword.remove()	

	puntos = loadsave.loadTable("gameData.json", system.DocumentsDirectory)
	print("Puntooooooos")
	print(puntos.variable.score)
	score = puntos.variable.score

	scoreText = display.newText( uiGroup, "Score: " .. score, xyManager.centreX(0), xyManager.centreY(-350), "Orientalismus.otf", 36 )
	scoreText:setFillColor(.28, .08, .13)

	-- Called when a key event has been received
	local lastEvent = {}
	local function onKeyEvent( event )
		local phase = event.phase
		local name = event.keyName
		if ( phase == lastEvent.phase ) and ( name == lastEvent.keyName ) then return false end  -- Filter repeating keys
		if phase == "down" then
			if "up" == name and jumpFlag == true and heroLive == true then
				hero.down()
				hero.cancelJump()
				sword.down()
				sword.cancelJump()
			end
			if "up" == name and jumpFlag == false and heroLive == true  then
				hero.jump()
				sword.jump()
				jumpFlag = true
			end
			if "right" == name and jumpFlag == false and heroLive == true  then
				patrones.spawn(mainGroup, 1)
			end
			if "left" == name and jumpFlag == false and heroLive == true  then
				patrones.spawn(mainGroup, 2)
			end
			if "space" == name and swordFlag == false and heroLive == true  then
				swordFlag = true
				sword.start()
				swordTimer = timer.performWithDelay( 500, removeSword, 1)
			end
			if "enter" == name then
				composer.gotoScene("menu", {time = 800, effect = "crossFade"})
			end
		elseif phase == "up" and jumpFlag == false then
			--hero.walk()
		end
		lastEvent = event
	 
	    -- IMPORTANT! Return false to indicate that this app is NOT overriding the received key
	    -- This lets the operating system execute its default handling of the key
	end
	

	-- Adding physics to the bodies
	--physics.addBody( hero:sprite, { density = 1.0, friction = 0.0, bounce = 0.5 } )
	 
	-- Add the key event listener
	Runtime:addEventListener( "key", onKeyEvent )
	Runtime:addEventListener( "enterFrame", loop )
	Runtime:addEventListener( "collision", onCollision )
	
	timer.performWithDelay( 1000, setScore, 0 )
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
		background.spawn(backGroup)
		background.start()
		background.startVel()
		Runtime:addEventListener( "enterFrame", parallax )

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
		sword.remove()
		physics.pause()
		print("entro al final")
		endGame()
		composer.removeScene( "game" )
		Runtime:removeEventListener( "key", onKeyEvent )
		Runtime:removeEventListener( "enterFrame", parallax )
		Runtime:removeEventListener( "enterFrame", loop )
		Runtime:removeEventListener( "collision", onCollision )


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
