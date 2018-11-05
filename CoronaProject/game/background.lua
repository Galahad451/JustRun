local background = {}

local xyManager = require("xyManager")
local physics = require("physics")

local sheetInfo = require("Sprites.backgroundData")
local myImageSheet = graphics.newImageSheet( "Sprites/backgroundSheet.png", sheetInfo:getSheet() )


local sequenceData = {
	{name = "cloudClose", frames = {1}},
	{name = "cloudFar", frames = {2}},
	{name = "cloudMiddle", frames = {3}},
	{name = "gnd", frames = {4}},
	{name = "mountains", frames = {5}},
	{name = "sky", frames = {6}}
}

local sky
local mountains
local cloudFar
local cloudMiddle
local cloudClose
local gnd
local gnd2
local floor

local gndFlag = false

--Collision
local bngCollisionFilter = { categoryBits=8, maskBits=16 }
local floorCollisionFilter = {categoryBits=4, maskBits=3}

local function spawn(grupo)

	sky = display.newSprite( grupo, myImageSheet, sequenceData )
	sky:setSequence( "sky" )
	sky.x = xyManager.centreX(0)
	sky.y = xyManager.centreY(0)
	table.insert(background, sky)

	mountains = display.newSprite( grupo, myImageSheet, sequenceData )
	mountains:setSequence( "mountains" )
	mountains.x = xyManager.centreX(200)
	mountains.y = xyManager.centreY(300)
	table.insert(background, mountains)

	cloudFar = display.newSprite( grupo, myImageSheet, sequenceData )
	cloudFar:setSequence( "cloudFar" )
	cloudFar.x = xyManager.centreX(400)
	cloudFar.y = xyManager.centreY(50)
	table.insert(background, cloudFar)

	cloudMiddle = display.newSprite( grupo, myImageSheet, sequenceData )
	cloudMiddle:setSequence( "cloudMiddle" )
	cloudMiddle.x = xyManager.centreX(-100)
	cloudMiddle.y = xyManager.centreY(100)
	table.insert(background, cloudMiddle)

	cloudClose = display.newSprite( grupo, myImageSheet, sequenceData )
	cloudClose:setSequence( "cloudClose" )
	cloudClose.x = xyManager.centreX(-400)
	cloudClose.y = xyManager.centreY(0)
	table.insert(background, cloudClose)

	floor = display.newSprite( grupo, myImageSheet, sequenceData )
	floor:setSequence( "gnd" )
	floor.x = xyManager.centreX(0)
	floor.y = xyManager.centreY(445)
	floor.myName = "floor"
	table.insert(background, floor)

	gnd = display.newSprite( grupo, myImageSheet, sequenceData )
	gnd:setSequence( "gnd" )
	gnd.x = xyManager.centreX(0)
	gnd.y = xyManager.centreY(420)
	table.insert(background, gnd)

	gnd2 = display.newSprite( grupo, myImageSheet, sequenceData )
	gnd2:setSequence( "gnd" )
	gnd2.x = xyManager.centreX(9000)
	gnd2.y = xyManager.centreY(420)
	table.insert(background, gnd2)
	
end

local function start()
	--Adding physics
	physics.addBody( gnd, "dynamic", {filter = bngCollisionFilter} )
	physics.addBody( gnd2, "dynamic", {filter = bngCollisionFilter} )
	physics.addBody( floor, "static", {filter = floorCollisionFilter} )
	physics.addBody( cloudClose, "dynamic", {filter = bngCollisionFilter})
	physics.addBody( cloudMiddle, "dynamic", {filter = bngCollisionFilter} )
	physics.addBody( cloudFar, "dynamic", {filter = bngCollisionFilter} )
	physics.addBody( mountains, "dynamic", {filter = bngCollisionFilter} )


	--Removing Gravity and setting velocity
	gnd.gravityScale = 0
	gnd2.gravityScale = 0
	floor.gravityScale = 0
	cloudClose.gravityScale = 0
	cloudMiddle.gravityScale = 0
	cloudFar.gravityScale = 0
	mountains.gravityScale = 0

	
end

local function delete()
	for i = #background, 1, -1 do
		local thisBG = background[i]
		display.remove( thisBG )
		table.remove( background, i )
	end
end

local function startVel()
	mountains:setLinearVelocity( -10, 0 )
	cloudClose:setLinearVelocity( -100, 0 )
	cloudMiddle:setLinearVelocity( -30, 0 )
	cloudFar:setLinearVelocity( -15, 0 )
	gnd:setLinearVelocity( -800, 0 )
	gnd2:setLinearVelocity( -800, 0 )
end

local function pauseVel()
	mountains:setLinearVelocity( 0, 0 )
	cloudClose:setLinearVelocity( 0, 0 )
	cloudMiddle:setLinearVelocity( 0, 0 )
	cloudFar:setLinearVelocity( 0, 0 )
	gnd:setLinearVelocity( 0, 0 )
	gnd2:setLinearVelocity( 0, 0 )
end

local function parallax()
	if mountains.x < - mountains.width/2 then
		mountains.x = display.contentWidth + mountains.width/2
	end
	if gnd.x + gnd.width/2 < display.contentWidth + 50 and gndFlag == false then
		gnd2.x = gnd.x + gnd.width
		gndFlag = true
	end
	if gnd2.x + gnd2.width/2 < display.contentWidth + 50 and gndFlag == true then
		gnd.x = gnd2.x + gnd2.width
		gndFlag = false
	end
	if cloudClose.x < - cloudClose.width/2 then
		cloudClose.x = display.contentWidth + cloudClose.width/2
	end
	if cloudMiddle.x < - cloudMiddle.width/2 then
		cloudMiddle.x = display.contentWidth + cloudMiddle.width/2
	end
	if cloudFar.x < - cloudFar.width/2 then
		cloudFar.x = display.contentWidth + cloudFar.width/2
	end
end


background.start = start
background.spawn = spawn
background.parallax = parallax
background.startVel = startVel
background.pauseVel = pauseVel
background.delete = delete


return background