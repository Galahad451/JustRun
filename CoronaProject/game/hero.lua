local hero = { }


local xyManager = require("xyManager")

local sheetInfo = require("Sprites.knightData")
local myImageSheet = graphics.newImageSheet( "Sprites/knightSheet.png", sheetInfo:getSheet() )
local physics = require("physics")

local swordSheetInfo = require("Sprites.swordData")
local mySwordSheet = graphics.newImageSheet( "Sprites/swordSheet.png", sheetInfo:getSheet() )


local heroCollisionFilter = {categoryBits=1, maskBits=6}

local sprite
local swordSprite

local sequenceData = {
	{	name = "walk", start = 2, count = 4, time = 800, loopCount = 0, loopDirection = "forward"},
	{	name = "idle", frames = { 1 }},
	{	name = "jump", frames = { 6 }},
	{	name = "down", frames = { 7 }}
}

local swordSequenceData = {
	{ name = "atk", frames = {1}}
}

local yMin

local function spawn(group)
	sprite = display.newSprite( group, myImageSheet, sequenceData )
	table.insert(hero, sprite)
	sprite.x = xyManager.leftEdge(sprite, 50)
	sprite.y = xyManager.centreY(320)
	yMin = sprite.y
	sprite.myName = "hero"
	print(table.maxn(hero))
end

local collision = true

local vx, vy

local function parallax()
	background.spawn()
end



local function down()
	sprite:setSequence("down")
	transition.cancel("heroCancel")
	transition.to( sprite, {time = 600, transition = easing.inExpo, x = sprite.x, y = xyManager.centreY(325), tag="heroMove"} )
end
local function jump()
	sprite:setSequence( "jump" )
	transition.cancel("heroCancel")
	transition.to( sprite, {time = 600, transition = easing.outExpo, onComplete=down, x = sprite.x, y = 201, tag="heroMove"} )
end
local function walk()
	sprite:setSequence( "walk" )
	sprite:play()
end
local function idle()
	sprite:setSequence( "idle" )
end
local function atk()
	sprite:setSequence( "atk" )
end
local function start()
	physics.addBody( sprite, {density=1.0, filter = heroCollisionFilter} )
	sprite.collision = onLocalCollision
	--sprite:setLinearVelocity( 0, 5000 )
	--sprite.gravityScale = 1
	sprite.gravityScale = 0
end

local function delete()
	display.remove(sprite)
	table.remove(hero, 1)
	print(table.maxn(hero))
end


local function vel()
	
end

local function cancelJump()
	transition.cancel( "heroMove" )
	transition.to(sprite, {time = 100, transition = linear, x = sprite.x, y = xyManager.centreY(325), tag = "heroCancel"})
	--sprite:setLinearVelocity( 0, 5000 )
end

local function getY()
	print( sprite.y )
end

hero.cancelJump = cancelJump
hero.spawn = spawn
hero.jump = jump
hero.walk = walk
hero.idle = idle
hero.atk = atk
hero.start = start
hero.down = down
hero.onLocalCollision = onLocalCollision
hero.delete = delete


return hero
