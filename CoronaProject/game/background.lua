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

local sky = display.newSprite( myImageSheet, sequenceData )
local mountains = display.newSprite( myImageSheet, sequenceData )
local cloudFar = display.newSprite( myImageSheet, sequenceData )
local cloudMiddle = display.newSprite( myImageSheet, sequenceData )
local cloudClose = display.newSprite( myImageSheet, sequenceData )
local floor = display.newSprite( myImageSheet, sequenceData )
local gnd = display.newSprite( myImageSheet, sequenceData )
local gnd2 = display.newSprite( myImageSheet, sequenceData )

local gndFlag = false

--Collision
local bngCollisionFilter = { categoryBits=8, maskBits=16 }
local floorCollisionFilter = {categoryBits=4, maskBits=3}

local function spawn()

	sky:setSequence( "sky" )
	sky.x = xyManager.centreX(0)
	sky.y = xyManager.centreY(0)
	sky.myName = "sky"
	table.insert(background, sky)

	mountains:setSequence( "mountains" )
	mountains.x = xyManager.centreX(200)
	mountains.y = xyManager.centreY(300)
	mountains.myName = "mountains"
	table.insert(background, mountains)

	cloudFar:setSequence( "cloudFar" )
	cloudFar.x = xyManager.centreX(400)
	cloudFar.y = xyManager.centreY(50)
	cloudFar.myName = "cloudFar"
	table.insert(background, cloudFar)

	cloudMiddle:setSequence( "cloudMiddle" )
	cloudMiddle.x = xyManager.centreX(-100)
	cloudMiddle.y = xyManager.centreY(100)
	cloudMiddle.myName = "cloudMiddle"
	table.insert(background, cloudMiddle)

	cloudClose:setSequence( "cloudClose" )
	cloudClose.x = xyManager.centreX(-400)
	cloudClose.y = xyManager.centreY(0)
	cloudClose.myName = "cloudClose"
	table.insert(background, cloudClose)

	floor:setSequence( "gnd" )
	floor.x = xyManager.centreX(0)
	floor.y = xyManager.centreY(445)
	floor.myName = "floor"
	table.insert(background, floor)

	gnd:setSequence( "gnd" )
	gnd.x = xyManager.centreX(0)
	gnd.y = xyManager.centreY(420)
	gnd.myName = "gnd"
	table.insert(background, gnd)

	gnd2:setSequence( "gnd" )
	gnd2.x = xyManager.centreX(9000)
	gnd2.y = xyManager.centreY(420)
	gnd2.myName = "gnd2"
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

local function startVel(level)
	local velLevel = level*0.2 + 1
	mountains:setLinearVelocity( -10*velLevel, 0 )
	cloudClose:setLinearVelocity( -100*velLevel, 0 )
	cloudMiddle:setLinearVelocity( -30*velLevel, 0 )
	cloudFar:setLinearVelocity( -15*velLevel, 0 )
	gnd:setLinearVelocity( -500*velLevel, 0 )
	gnd2:setLinearVelocity( -500*velLevel, 0 )
end

local function setVel(level)
	local velLevel = level*0.2 + 1
	mountains:setLinearVelocity( -10*velLevel, 0 )
	cloudClose:setLinearVelocity( -100*velLevel, 0 )
	cloudMiddle:setLinearVelocity( -30*velLevel, 0 )
	cloudFar:setLinearVelocity( -15*velLevel, 0 )
	gnd:setLinearVelocity( -500*velLevel, 0 )
	gnd2:setLinearVelocity( -500*velLevel, 0 )
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

local function toBack()
	gnd2:toBack()
	gnd:toBack()
	cloudClose:toBack()
	cloudMiddle:toBack()
	mountains:toBack()
	cloudFar:toBack()
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


return background