local composer = require( "composer" )
local xyManager = require( "system.xyManager" )
local loadsave = require("system.loadsave")
local gameData = require("system.gameData")
local uiManager = require("system.UIManager")
local fonts = require("system.fonts")
local popUps = require("system.popUps")
local movement = require("system.movement")

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

local scoreText
local scoreText2

local puntos = {}

local level = 1
local velocity = 1
local velPrev = 0
local levelUpTimer
local velUpTimer
local tutorialPart = 0
local pauseFlag = false

local yIni = 0
local yFini = 0

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

--Sonidos

--Variables
local jumpFlag = false
local downFlag = true
local swordFlag = false
local heroLive = true
local score
local swordTimer
local scoreTimer

local levelBool = false

physics.start( true )
physics.setGravity( 0, 9.8 )
physics.setDrawMode( "normal" )

local function parallax()
	background.parallax()
end

local function loop()
	background.setVel(velocity)
	sprites.delete()
	if(levelBool == false) then
		patrones.frames(mainGroup, level, velocity)
	end
end

local function setScore()
	score = score + math.round( velocity )
	scoreText.text =  score .. "m"
end

local function resetGame()
	patrones.delete()
	composer.gotoScene("screens.reset", {time = 800, effect = "crossFade"})
end

local function endGame()
	timer.cancel( levelUpTimer )
	timer.cancel( velUpTimer )
	--hero.delete()
	gameData.persistent.score = score
	loadsave.saveTable(gameData.persistent, "gameData.json", system.DocumentsDirectory)
	timer.performWithDelay( 2000, resetGame, 1 )
end

local function gotoMenu()
	composer.gotoScene("screens.menu", {time = 800, effect = "crossFade"})
end

local function pauseGame()
	movement.push(pauseButton, "")
	if (pauseFlag == false) then
		patrones.pause(0)
		velPrev = velocity
		velocity = 0
		timer.pause( scoreTimer )
		timer.pause( levelUpTimer )
		timer.pause( velUpTimer )
		pauseFlag = true
		audio.pause( {channel = 1} )
		audio.pause( {channel = 2} )
		audio.pause( {channel = 3} )
		hero.pause()
	else
		velocity = velPrev
		patrones.pause(velocity )
		timer.resume( scoreTimer )
		timer.resume( levelUpTimer )
		timer.resume( velUpTimer )
		pauseFlag = false 
		audio.resume( {channel = 1} )
		audio.resume( {channel = 2} )
		audio.resume( {channel = 3} )
		hero.play()
	end
end

local function attackTutorial()
	pauseGame()
	level = 2
	gameData.persistent.tutorial = 3
	loadsave.saveTable(gameData.persistent, "gameData.json")
	popUps.spawnTutorial(gameData.persistent.tutorial)
end

local function downTutorial()
	pauseGame()
	gameData.persistent.tutorial = 2
	loadsave.saveTable(gameData.persistent, "gameData.json")
	popUps.spawnTutorial(gameData.persistent.tutorial)
end

local function upTutorial()
	pauseGame()
	gameData.persistent.tutorial = 1
	popUps.spawnTutorial(gameData.persistent.tutorial)
	loadsave.saveTable(gameData.persistent, "gameData.json")
end

local function onCollision(event)

	local obj1 = event.object1
	local obj2 = event.object2

	--Colisión entre espada y enemigo
	if(obj1.myName == "hero" and obj2.myName == "enemyRed" and swordFlag == true) or
		(obj2.myName == "hero" and obj1.myName == "enemyRed" and swordFlag == true) then
		if(obj2.myName == "enemyRed") then
			sprites.spawnExplosion(obj2.x, obj2.y)
			display.remove(obj2)
			audio.stop( {channel = 3} )
			audio.play( sounds.destroyWood, {channel = 3} )
			
		else
			sprites.spawnExplosion(obj1.x, obj1.y)
			display.remove(obj1)
			audio.stop( {channel = 3} )
			audio.play( sounds.destroyWood, {channel = 3} )
		end
		for i = #enemy, 1, -1 do
			if ( enemy[i] == obj1 or enemy[i] == obj2 ) then
				table.remove( enemy, i )
				break
			end
		end
	end
	if (obj1.myName == "hero" and obj2.myName == "greenDragon" and swordFlag == true) or
		(obj2.myName == "hero" and obj1.myName == "greenDragon" and swordFlag == true)
	then
		if(obj2.myName == "greenDragon") then
			sprites.spawnExplosion(obj2.x, obj2.y)
			display.remove(obj2)
		else
			sprites.spawnExplosion(obj1.x, obj1.y)
			display.remove(obj1)
		end
		for i = #enemy, 1, -1 do
			if ( enemy[i] == obj1 or enemy[i] == obj2 ) then
				table.remove( enemy, i )
				break
			end
		end
	end

	if (obj1.myName == "hero" and obj2.myName == "tutorial") or
		(obj1.myName == "tutorial" and obj2.myName == "hero") then
		if (gameData.persistent.tutorial == 0) then
			upTutorial()
		end
		if (gameData.persistent.tutorial == 2) then
			attackTutorial()
		end
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
		audio.stop( {channel = 2} )
		audio.play( sounds.death, {channel = 2})
		heroLive = false
		timer.cancel(scoreTimer)
		audio.stop( {channel = 1} )
		audio.rewind( sounds.menu )
		endGame()
		--composer.gotoScene("screens.menu", {time = 800, effect = "crossFade"})
	end



	--Colision entre el suelo y el heroe para que cambie de animación
	if((obj1.myName == "hero" and obj2.myName == "floor") or 
		(obj1.myName == "floor" and obj2.myName == "hero")
		and heroLive == true ) then
		if ( event.phase == "began" ) then
			jumpFlag = false
			if (pauseFlag) then
				hero.pause()
			else
				hero.walk()
			end
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
		if "space" == name and swordFlag == false and heroLive == true  then
		end
	end
	lastEvent = event
end



local function jumpListener( event )
	if (pauseFlag == false or gameData.persistent.tutorial == 1 or gameData.persistent.tutorial == 2) then
		if(event.phase == "began") then
			yIni = event.y
		elseif(event.phase == "moved") then
			yFini = event.y
			if(yFini < yIni-100 and jumpFlag == false and heroLive == true and (gameData.persistent.tutorial == 1 or gameData.persistent.tutorial == 4)) then
				if (gameData.persistent.tutorial == 1) then
					pauseGame()
					popUps.removeTutorial()
					timer.performWithDelay( 800, downTutorial, 1 )
				end
				hero.jump()
				hero.setSeq(2)
				jumpFlag = true
				downFlag = false
				audio.stop( {channel = 2} )
				audio.play( sounds.jump , {channel = 2})
			end
			if(yFini > yIni + 100  and jumpFlag == true and heroLive == true and downFlag == false and (gameData.persistent.tutorial == 2 or gameData.persistent.tutorial == 4)) then
				if (gameData.persistent.tutorial == 2) then
					pauseGame()
					popUps.removeTutorial()
				end
				hero.down()
				hero.cancelJump()
				downFlag = true
				audio.stop({channel = 2})
				audio.play( sounds.down , {channel = 2})
			end
		end
	end
end

local function attackListener( event )
	if (pauseFlag == false or gameData.persistent.tutorial == 3) then
		if event.x > display.contentWidth/2 and swordFlag == false and heroLive == true  and (gameData.persistent.tutorial == 3 or gameData.persistent.tutorial == 4) then
			if (gameData.persistent.tutorial == 3) then
				pauseGame()
				popUps.removeTutorial()
				gameData.persistent.tutorial = 4
				loadsave.saveTable(gameData.persistent, "gameData.json")
			end
			audio.stop( {channel = 2} )
			audio.play( sounds.attack , {channel = 2} )
			swordFlag = true
			swordTimer = timer.performWithDelay( 400, removeSword, 1)
			if jumpFlag == true then
				hero.atk(2)
			else
				hero.atk(1)
			end
		end
	end
end

local function levelUp()
	local function setBoolLevel()
		audio.stop( {channel = 3} )
		audio.play( sounds.speedUp, {channel = 3} )
		velPrev = velocity
		velocity = velocity*3
		local function slowDown()
			velocity = velPrev - velPrev/4
			levelBool = false
		end
		timer.performWithDelay( 3000, slowDown , 1 )
	end
	audio.stop( {channel = 2} )
	level = level + 1
	levelBool = true
	timer.performWithDelay(2500, setBoolLevel, 1)
end

local function velUp()
	velocity = velocity + 0.1
end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	audio.play( sounds.game ,{channel = 1, loops = -1} )
	score = 0
	if (gameData.persistent.tutorial == 4) then
		level = 2
	else
		level = 1
	end
	velocity = 1
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
	patrones.spawnFrame(mainGroup, level, velocity)

	background.toBack()
	background.startVel(velocity)

	puntos = loadsave.loadTable("gameData.json", system.DocumentsDirectory)

	uiManager.displayGreenBox(uiGroup, xyManager.centreX(-400), xyManager.centreY(-345))
	pauseButton = uiManager.pauseButton(uiGroup)
	pauseButton:addEventListener( "tap", pauseGame )

	scoreText = display.newEmbossedText( uiGroup, score .. "m", xyManager.centreX(-400), xyManager.centreY(-345), fonts.main, 36 )
	local color = { 
		highlight = {r = 0, g = 0, b = 0, a = 0.5}, 
		shadow = {r = 0, g = 0, b = 0, a = 0.5}
	}
	
	scoreText:setFillColor( 1, 1, 1 )
	scoreText:setEmbossColor( color )
		 
	-- Add the key event listener
	Runtime:addEventListener( "enterFrame", loop )
	Runtime:addEventListener( "collision", onCollision )
	Runtime:addEventListener( "enterFrame", parallax )
	Runtime:addEventListener( "touch", jumpListener )
	Runtime:addEventListener( "tap", attackListener )
	Runtime:addEventListener( "key", onKeyEvent )
	
	scoreTimer = timer.performWithDelay( 100, setScore, 0 )
	levelUpTimer = timer.performWithDelay( 40000, levelUp, 0 )
	velUpTimer = timer.performWithDelay( 5000, velUp, 0 )
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
		composer.removeScene("screens.game")


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