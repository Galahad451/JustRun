local sword = { }


local xyManager = require("xyManager")

local sheetInfo = require("Sprites.swordData")
local myImageSheet = graphics.newImageSheet( "Sprites/swordSheet.png", sheetInfo:getSheet() )
local physics = require("physics")

local heroCollisionFilter = {categoryBits=1, maskBits=6}
local bngCollisionFilter = { categoryBits=8, maskBits=16 }

local sprite

local sequenceData = {
	{ name = "atk", frames = {1}}
}

local yMin

local function spawn(group)
	sprite = display.newSprite( group, myImageSheet, sequenceData )
	sprite.x = xyManager.leftEdge(sprite, 50)
	sprite.y = xyManager.centreY(320)
	yMin = sprite.y
	sprite.myName = "sword"
	sprite.isVisible = false
end

local collision = true



local function down()
	sprite:setSequence("down")
	transition.cancel("swordCancel")
	transition.to( sprite, {time = 600, transition = easing.inExpo, x = sprite.x, y = 720, tag="swordMove"} )
end
local function jump()
	sprite:setSequence( "jump" )
	transition.cancel("swordCancel")
	transition.to( sprite, {time = 600, transition = easing.outExpo, onComplete=down, x = sprite.x, y = 201, tag="swordMove"} )
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

local function cancelJump()
	transition.cancel( "swordMove" )
	--sprite:setLinearVelocity( 0, 5000 )
	transition.to(sprite, {time = 100, transition.linear, x = sprite.x, y = xyManager.centreY(320), tag="swordCancel"})
end

local function start()
	physics.addBody( sprite, "dynamic", {density=1.0, filter = heroCollisionFilter} )
	sprite.collision = false
	sprite.gravityScale = 0
	sprite.isVisible = true
end

local function remove()
	physics.removeBody(sprite)
	sprite.isVisible = false
end

sword.spawn = spawn
sword.start = start
sword.jump = jump
sword.down = down
sword.cancelJump = cancelJump
sword.remove = remove


return sword
