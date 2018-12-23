local background = {}

local xyManager = require("system.xyManager")
local physics = require("physics")
local gameData = require("system.gameData")
local loadsave = require("system.loadsave")

local sheetFarData = require("sprites.background.farData")
local sheetFar = graphics.newImageSheet( "sprites/background/farSheet.png", sheetFarData:getSheet() )

local sheetFrontData = require("sprites.background.frontData")
local sheetFront = graphics.newImageSheet( "sprites/background/frontSheet.png", sheetFrontData:getSheet() )

local sheetGroundData = require("sprites.background.groundData")
local sheetGround = graphics.newImageSheet( "sprites/background/groundSheet.png", sheetGroundData:getSheet() )

local sheetBackData = require("sprites.background.backData")
local sheetBack = graphics.newImageSheet( "sprites/background/backSheet.png", sheetBackData:getSheet() )

local sheetSkyData = require("sprites.background.skyData")
local sheetSky = graphics.newImageSheet( "sprites/background/skySheet.png", sheetSkyData:getSheet() )

local sequenceData = {
	{ name = "sky", sheet = sheetSky, frames = { 1 , 2 , 3 , 4 }},
	{ name = "far", sheet = sheetFar, frames = { 1 , 2 , 3 , 4 }},
	{ name = "front", sheet = sheetFront, frames = { 1 , 2 , 3 , 4 , 5}},
	{ name = "ground", sheet = sheetGround, frames = { 1 , 2, 3, 4 }},
	{ name = "back", sheet = sheetBack, frames = { 1 , 2, 3, 4, 5 }}
}

local sky = display.newSprite( sheetSky, sequenceData )
local far = display.newSprite( sheetFar, sequenceData )
local far2 = display.newSprite( sheetFar, sequenceData )
local back = display.newSprite( sheetBack, sequenceData )
local back2 = display.newSprite( sheetBack, sequenceData )
local front = display.newSprite( sheetFront, sequenceData )
local front2 = display.newSprite( sheetFront, sequenceData )
local ground = display.newSprite( sheetGround, sequenceData )
local ground2 = display.newSprite( sheetGround, sequenceData )
local floor = display.newSprite( sheetGround, sequenceData )

--Collision
local bngCollisionFilter = { categoryBits=8, maskBits=16 }
local floorCollisionFilter = {categoryBits=4, maskBits=3}

local function setPosition()
	if gameData.persistent.skin == 1 then
		far.x = xyManager.centreX(0)
		far.y = xyManager.centreY(0)
		far2.x = xyManager.centreX(far.x + far.width/2)
		far2.y = xyManager.centreY(0)
		front.x = xyManager.centreX(0)
		front.y = xyManager.centreY(0)
		front2.x = xyManager.centreX(front.x+front.width/2)
		front2.y = xyManager.centreY(0)
		back.x = xyManager.centreX(0)
		back.y = xyManager.centreY(0)
		back2.x = xyManager.centreX(back.x + back.width/2)
		back2.y = xyManager.centreY(0)
		ground.x = xyManager.centreX(0)
		ground2.x = xyManager.centreX(ground.x + ground.width/2)
	elseif gameData.persistent.skin == 2 then
		far.y = xyManager.centreY(200)
		far2.y = xyManager.centreY(250)
		front.x = xyManager.centreX(0)
		front.y = xyManager.centreY(0)
		front2.x = xyManager.centreX(front2.width+display.contentWidth/2)
		front2.y = xyManager.centreY(-200)
		back.x = xyManager.centreX(0)
		back.y = xyManager.centreY(300)
		back2.x = xyManager.centreX(20)
		back2.y = xyManager.centreY(300)
		ground.x = xyManager.centreX(0)
		ground2.x = xyManager.centreX(ground.x + ground.width/2)
	elseif gameData.persistent.skin == 3 then
		far.x = xyManager.centreX(0)
		far2.x = xyManager.centreX(far2.width)
		far.y = xyManager.centreY(20)
		far2.y = xyManager.centreY(20)
		front.x = xyManager.centreX(0)
		front.y = xyManager.centreY(0)
		front2.x = xyManager.centreX(display.contentWidth/2)
		front2.y = xyManager.centreY(-100)
		back.x = xyManager.centreX(0)
		back.y = xyManager.centreY(0)
		back2.x = xyManager.centreX(display.contentWidth/2)
		back2.y = xyManager.centreY(20)
		ground.x = xyManager.centreX(0)
		ground2.x = xyManager.centreX(ground.x + ground.width/2)
	elseif gameData.persistent.skin == 4 then
		far.x = xyManager.centreX(0)
		far2.x = far.x + far.width
		far.y = xyManager.centreY(0)
		far2.y = xyManager.centreY(0)
		front.x = xyManager.centreX(0)
		front.y = xyManager.centreY(355)
		front2.x = xyManager.centreX(display.contentWidth+200)
		front2.y = xyManager.centreY(355)
		back.x = xyManager.centreX(-100)
		back.y = xyManager.centreY(150)
		back2.x = xyManager.centreX(display.contentWidth/2+200)
		back2.y = xyManager.centreY(150)
		ground.x = xyManager.centreX(0)
		ground.y = xyManager.centreY(440)
		ground2.x = xyManager.centreX(ground.x + ground.width/2)
		ground2.y = xyManager.centreY(440)
		floor.y = xyManager.centreY(451)
	end

end

local function setVel(velocity)
	far:setLinearVelocity( -10*velocity, 0 )
	far2:setLinearVelocity( -10*velocity, 0 )
	front:setLinearVelocity( -500*velocity, 0 )
	front2:setLinearVelocity( -500*velocity, 0 )
	back:setLinearVelocity( -35*velocity, 0 )
	back2:setLinearVelocity( -35*velocity, 0 )
	ground:setLinearVelocity( -500*velocity, 0 )
	ground2:setLinearVelocity( -500*velocity, 0 )
end

local function changeSkin()
	sky:setFrame( gameData.persistent.skin )
	back:setFrame( gameData.persistent.skin )
	back2:setFrame( gameData.persistent.skin )
	if (gameData.persistent.skin == 4) then
		front:setFrame( math.random( 4, 5 ) )
	else
		front:setFrame( gameData.persistent.skin )
		front2:setFrame( gameData.persistent.skin )
	end
	far:setFrame( gameData.persistent.skin )
	far2:setFrame( gameData.persistent.skin )
	ground:setFrame( gameData.persistent.skin )
	ground2:setFrame( gameData.persistent.skin )
	floor:setFrame( gameData.persistent.skin )
	setPosition()
end

local function spawn()

	sky:setSequence( "sky" )
	sky.x = xyManager.centreX(0)
	sky.y = xyManager.centreY(0)
	sky:setFrame( gameData.persistent.skin )
	sky.myName = "sky"
	table.insert(background, sky)

	far:setSequence( "far" )
	far.x = xyManager.centreX(200)
	far.y = xyManager.centreY(300)
	far:setFrame( gameData.persistent.skin )
	far.myName = "far"
	table.insert(background, far)

	far2:setSequence( "far" )
	far2.x = xyManager.centreX(far.x + far.width/2)
	far2.y = xyManager.centreY(300)
	far2:setFrame( gameData.persistent.skin )
	far2.myName = "far2"
	table.insert(background, far2)
	back:setFrame( gameData.persistent.skin )

	back:setSequence( "back" )
	back.x = xyManager.centreX(400)
	back.y = xyManager.centreY(50)
	back:setFrame( gameData.persistent.skin )
	back.myName = "back"
	table.insert(background, back)

	back2:setSequence( "back" )
	back2.x = xyManager.centreX(400)
	back2.y = xyManager.centreY(50)
	back2:setFrame( gameData.persistent.skin )
	back2.myName = "back2"
	table.insert(background, back2)
	back2:setFrame( gameData.persistent.skin )

	front:setSequence( "front" )
	front.x = xyManager.centreX(-100)
	front.y = xyManager.centreY(100)
	front:setFrame( gameData.persistent.skin )
	front.myName = "front"
	table.insert(background, front)

	front2:setSequence( "front" )
	front2.x = xyManager.centreX(-100)
	front2.y = xyManager.centreY(100)
	front2:setFrame( gameData.persistent.skin )
	front2.myName = "front2"
	table.insert(background, front2)
	transition.to(front2, {xScale = -1, time = 0})

	floor:setSequence( "ground" )
	floor.x = xyManager.centreX(0)
	floor.y = xyManager.centreY(445)
	floor:setFrame( gameData.persistent.skin )
	floor.myName = "floor"
	table.insert(background, floor)

	ground:setSequence( "ground" )
	ground.x = xyManager.centreX(0)
	ground.y = xyManager.centreY(400)
	ground:setFrame( gameData.persistent.skin )
	ground.myName = "ground"
	table.insert(background, ground)

	ground2:setSequence( "ground" )
	ground2.x = xyManager.centreX(ground2.width)
	ground2.y = xyManager.centreY(400)
	ground2:setFrame( gameData.persistent.skin )
	ground2.myName = "ground2"
	table.insert(background, ground2)
	changeSkin()
end

local function start()
	--Adding physics
	physics.addBody( ground, "dynamic", {filter = bngCollisionFilter} )
	physics.addBody( ground2, "dynamic", {filter = bngCollisionFilter} )
	physics.addBody( floor, "static", {filter = floorCollisionFilter} )
	physics.addBody( front, "dynamic", {filter = bngCollisionFilter} )
	physics.addBody( front2, "dynamic", {filter = bngCollisionFilter} )
	physics.addBody( back, "dynamic", {filter = bngCollisionFilter} )
	physics.addBody( back2, "dynamic", {filter = bngCollisionFilter} )
	physics.addBody( far, "dynamic", {filter = bngCollisionFilter} )
	physics.addBody( far2, "dynamic", {filter = bngCollisionFilter} )


	--Removing Gravity and setting velocity
	ground.gravityScale = 0
	ground2.gravityScale = 0
	floor.gravityScale = 0
	front.gravityScale = 0
	front2.gravityScale = 0
	back.gravityScale = 0
	back2.gravityScale = 0
	far.gravityScale = 0
	far2.gravityScale = 0

	
end

local function delete()
	for i = #background, 1, -1 do
		local thisBG = background[i]
		display.remove( thisBG )
		table.remove( background, i )
	end
end

local function startVel(velocity)
	far:setLinearVelocity( -10*velocity, 0 )
	far2:setLinearVelocity( -10*velocity, 0 )
	front:setLinearVelocity( -300*velocity, 0 )
	front2:setLinearVelocity( -300*velocity, 0 )
	back:setLinearVelocity( -15*velocity, 0 )
	back2:setLinearVelocity( -15*velocity, 0 )
	ground:setLinearVelocity( -500*velocity, 0 )
	ground2:setLinearVelocity( -500*velocity, 0 )
end

local function pauseVel()
	far:setLinearVelocity( 0, 0 )
	far2:setLinearVelocity( 0, 0 )
	front:setLinearVelocity( 0, 0 )
	front2:setLinearVelocity( 0, 0 )
	back:setLinearVelocity( 0, 0 )
	back2:setLinearVelocity( 0, 0 )
	ground:setLinearVelocity( 0, 0 )
	ground2:setLinearVelocity( 0, 0 )
end

local function parallax()
	if (far.x + far.width/2 <= 0) then
		far.x = far2.x + far2.width
	end
	if (far2.x + far2.width/2 <= 0) then
		far2.x = far.x + far.width
	end

	if front.x + front.width/2 < 0 then
		front.x = display.contentWidth + front.width/2
		if (gameData.persistent.skin == 4) then
			front:setFrame( math.random( 4, 5 ) )
			front.x = math.random( display.contentWidth + front.width/2, display.contentWidth + front.width/2 + 2000 )
		end
	end
	if front2.x + front2.width/2 < 0 then
		front2.x = display.contentWidth + front2.width/2
		if (gameData.persistent.skin == 4) then
			front2:setFrame( math.random( 4, 5 ) )
			front2.x = math.random( display.contentWidth + front.width/2, display.contentWidth + front.width/2 + 500 )
		end
	end

	if ground.x + ground.width/2 < 0 then
		ground.x = ground2.x + ground2.width
	end
	if ground2.x + ground2.width/2 < 0 then
		ground2.x = ground.x + ground.width
	end

	if back.x + back.width/2 < 0 then
		back.x = display.contentWidth + back.width/2
		if (gameData.persistent.skin == 4) then
			back:setFrame( math.random( 4, 5 ) )
			back.x = math.random( display.contentWidth + back.width/2, display.contentWidth + back.width/2 + 2000 )
		end
	end
	if back2.x + back2.width/2 < 0 then
		back2.x = display.contentWidth + back2.width/2
		if (gameData.persistent.skin == 4) then
			back2:setFrame( math.random( 4, 5 ) )
			back2.x = math.random( display.contentWidth + back.width/2, display.contentWidth + back.width/2 + 500 )
		end
	end
end

local function toBack()
	ground2:toBack()
	ground:toBack()
	front:toBack()
	front2:toBack()
	back:toBack()
	back2:toBack()
	far:toBack()
	far2:toBack()
	sky:toBack()
	floor:toBack()
end

background.start = start
background.spawn = spawn
background.parallax = parallax
background.startVel = startVel
background.pauseVel = pauseVel
background.delete = delete
background.toBack = toBack
background.setVel = setVel
background.changeSkin = changeSkin


return background