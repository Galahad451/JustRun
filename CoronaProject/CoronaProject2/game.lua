
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

local level = 1

local yIni = 0
local yFini = 0

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

--Variables
local jumpFlag = false
local downFlag = true
local swordFlag = false
local heroLive = true
local score
local swordTimer
local scoreTimer

local levelBool = false

local deathSound = audio.loadSound("music/deathMario.mp3", {channel = 2,
    loops = -1,
    duration = 30000,
    fadein = 5000,
    onComplete = callbackListener})


physics.start( true )
physics.setGravity( 0, 9.8 )
--physics.setScale( 30 )
physics.setDrawMode( "normal" )

local function parallax()
	background.parallax()
end

local function loop()
	if(levelBool == false) then
		patrones.frames(mainGroup, level)
		background.setVel(level)
	end
	if(audio.isChannelActive(1)) then
		print("TRUE active channel")
	end
end

local function setBoolLevel()
	levelBool = false
end

local function setScore()
	score = score + 1
	scoreText.text = "Score: " .. score
end

local function endGame()
	patrones.delete()
	hero.delete()
	if (puntos.highScore < score) then
		puntos.highScore = score
		gameData.persistent.highScore = score
	end
	loadsave.saveTable(puntos, "gameData.json", system.DocumentsDirectory)
	level = 1
end

local function gotoMenu()
	composer.gotoScene("menu", {time = 800, effect = "crossFade"})
end

local function onCollision(event)
	local obj1 = event.object1
	local obj2 = event.object2

	--Colisión entre espada y enemigo
	if(obj1.myName == "hero" and obj2.myName == "enemyRed" and swordFlag == true) or
		(obj2.myName == "hero" and obj1.myName == "enemyRed" and swordFlag == true) then
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
	if (obj1.myName == "hero" and obj2.myName == "greenDragon" and swordFlag == true) or
		(obj2.myName == "hero" and obj1.myName == "greenDragon" and swordFlag == true)
	then
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
	if((obj1.myName == "enemyRed" and obj2.myName == "hero" and heroLive == true and swordFlag == false)
		or (obj1.myName == "hero" and obj2.myName == "enemyRed"  and heroLive == true and swordFlag == false)
		or (obj1.myName == "enemyYellow" and obj2.myName == "hero"  and heroLive == true)
		or (obj1.myName == "hero" and obj2.myName == "enemyYellow"  and heroLive == true)
		or (obj1.myName == "greenDragon" and obj2.myName == "hero"  and heroLive == true and swordFlag == false)
		or (obj1.myName == "hero" and obj2.myName == "greenDragon"  and heroLive == true and swordFlag == false)
		or (obj1.myName == "redDragon" and obj2.myName == "hero"  and heroLive == true)
		or (obj1.myName == "hero" and obj2.myName == "redDragon"  and heroLive == true)) then
		hero.die()
		heroLive = false
		timer.cancel(scoreTimer)
		audio.play(deathSound)
		timer.performWithDelay(1000, gotoMenu, 1)
		--composer.gotoScene("menu", {time = 800, effect = "crossFade"})
	end



	--Colision entre el suelo y el heroe para que cambie de animación
	if((obj1.myName == "hero" and obj2.myName == "floor") or 
		(obj1.myName == "floor" and obj2.myName == "hero")
		and heroLive == true ) then
		if ( event.phase == "began" ) then
			jumpFlag = false
			hero.walk()

		end
		if (event.phase == "ended" and heroLive == true) then
			jumpFlag = true

		end
	end
end

local function removeSword()
	swordFlag = false
	if jumpFlag == true then
		hero.setSeq(5)
	else
		hero.setSeq(1)
	end
end


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
		end
		if "up" == name and jumpFlag == false and heroLive == true  then
			hero.setSeq(2)
			hero.jump()
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
			swordTimer = timer.performWithDelay( 400, removeSword, 1)
			if jumpFlag == true then
				hero.atk(2)
			else
				hero.atk(1)
			end
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

local function jumpListener( event )
	if(event.phase == "began") then
		yIni = event.y
	elseif(event.phase == "moved") then
		yFini = event.y
		if(yFini < yIni-100 and jumpFlag == false and heroLive == true) then
			hero.jump()
			hero.setSeq(2)
			jumpFlag = true
			downFlag = false
		end
		if(yFini > yIni + 100  and jumpFlag == true and heroLive == true and downFlag == false) then
			hero.down()
			hero.cancelJump()
			downFlag = true
		end
	end
end

local function attackListener( event )
	if event.x > display.contentWidth/2 and swordFlag == false and heroLive == true  then
		swordFlag = true
		swordTimer = timer.performWithDelay( 400, removeSword, 1)
		if jumpFlag == true then
			hero.atk(2)
		else
			hero.atk(1)
		end
	end
end

local function levelUp()
	level = level + 1
	levelBool = true
	timer.performWithDelay(3000, setBoolLevel, 1)
end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	score = 0
	level = 1
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
	patrones.spawnFrame(mainGroup, level)

	sword.spawn(mainGroup)
	sword.remove()	

	background.toBack()
	background.startVel(level)

	puntos = loadsave.loadTable("gameData.json", system.DocumentsDirectory)

	scoreText = display.newText( uiGroup, "Score: " .. score, xyManager.centreX(0), xyManager.centreY(-350), "Orientalismus.otf", 36 )
	scoreText:setFillColor(.28, .08, .13)
	

	-- Adding physics to the bodies
	--physics.addBody( hero:sprite, { density = 1.0, friction = 0.0, bounce = 0.5 } )
	 
	-- Add the key event listener
	Runtime:addEventListener( "enterFrame", loop )
	Runtime:addEventListener( "collision", onCollision )
	Runtime:addEventListener( "enterFrame", parallax )
	Runtime:addEventListener( "touch", jumpListener )
	Runtime:addEventListener( "tap", attackListener )
	Runtime:addEventListener( "key", onKeyEvent )
	
	
	scoreTimer = timer.performWithDelay( 1000, setScore, 0 )
	timer.performWithDelay( 15000, levelUp, 0 )
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
		sword.remove()
		endGame()

		composer.removeScene("game")


	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
	Runtime:removeEventListener( "enterFrame", parallax )
	Runtime:removeEventListener( "enterFrame", loop )
	Runtime:removeEventListener( "collision", onCollision )
	Runtime:removeEventListener( "touch", jumpListener )
	Runtime:removeEventListener( "tap", attackListener )
	Runtime:removeEventListener( "key", onKeyEvent )

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
