local hero = { }


local xyManager = require("system.xyManager")
local gameData = require("system.gameData")

local sheetInfo = require("sprites.ninjaData")
local myImageSheet = graphics.newImageSheet( "sprites/ninjaSheet.png", sheetInfo:getSheet() )
local physics = require("physics")

local heroCollisionFilter = {categoryBits=1, maskBits=6}
-- local heroCollisionFilter = {categoryBits=8, maskBits=16}

local sprite
local runSequence = "princessRun"
local jumpSequence = "princessJump"
local fallSequence = "princessFall"
local runAttackSequence = "princessRunAtk"
local jumpAttackSequence = "princessJumpAtk"
local dieSequence = "princessDie"

local sequenceData = {
	{	name = "knightWalk", start = 14, count = 4, time = 800, loopCount = 0, loopDirection = "forward"},
	{	name = "knightIdle", frames = { 12 }},
	{	name = "knightJump", frames = { 13 }},
	{	name = "knightDown", frames = { 11 }},
	{	name = "princessRun", start = 77, count = 18, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "princessJump", start = 56, count = 6, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "princessFall", start = 50, count = 6, time = 400, loopCount = 0, loopDirection = "forward"}, 
	{	name = "princessDie", start = 35, count = 15, time = 400, loopCount = 1, loopDirection = "forward"},
	{	name = "princessRunAtk", start = 95, count = 18, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "princessJumpAtk", start = 62, count = 15, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "ninjaRun", start = 18, count = 12, time = 400, loopCount = 0, loopDirection = "forward"}
}

local yMin

local collision = true

local vx, vy

local function setPos()
	local skin = gameData.persistent.skin
	if skin == 2 then
		print("Posicion")
		sprite.y = xyManager.centreY(320)
	else
		sprite.y = xyManager.centreY(320)
	end
end

local function down()
	if sprite.sequence == "princessJump" then
		sprite:setSequence(fallSequence)
	end
	sprite:play()
	transition.cancel("heroCancel")
	transition.to( sprite, {time = 600, transition = easing.inExpo, x = sprite.x, y = xyManager.centreY(325), tag="heroMove"} )
end
local function jump()
	transition.cancel("heroCancel")
	transition.to( sprite, {time = 600, transition = easing.outExpo, onComplete=down, x = sprite.x, y = 201, tag="heroMove"} )
end
local function walk()
	sprite:setSequence( runSequence )
	sprite:play()
end
local function idle()
	sprite:setSequence( "idle" )
end
local function atk(seq)
	if seq == 1 then
		sprite:setSequence( runAttackSequence )
	else
		sprite:setSequence(	jumpAttackSequence )
	end
	sprite:play()
end

local function start()
	physics.addBody( sprite, {density=1.0, filter = heroCollisionFilter} )
	sprite.collision = onLocalCollision
	sprite.gravityScale = 0
end

local function delete()
	display.remove(sprite)
	table.remove(hero, 1)
	print(table.maxn(hero))
end

local function die()
	sprite:setSequence(dieSequence)
	sprite:play()
	transition.to( sprite, {rotation=-900, time=500, transition=easing.linear, y = sprite.y - 100})
	transition.to( sprite, {rotation=-900, time=500, delay=500, transition=easing.inExpo, y = display.contentHeight + 200})
end

local function cancelJump()
	transition.cancel( "heroMove" )
	transition.to(sprite, {time = 100, transition = linear, x = sprite.x, y = xyManager.centreY(325), tag = "heroCancel"})
end

local function getY()
	print( sprite.y )
end

local function setSeq(number)
	if number == 1 then
		sprite:setSequence(runSequence)
	elseif number == 2 then
		sprite:setSequence(jumpSequence)
	elseif number == 3 then
		sprite:setSequence(runAttackSequence)
	elseif number == 4 then
		sprite:setSequence(jumpAttackSequence)
	elseif number == 5 then
		sprite:setSequence(fallSequence)
	end
	sprite:play()
end

local function getSeq()
	return sprite.sequence
end

local function changeSkin()
	local skin = gameData.persistent.skin 
	if skin == 2 then
		runSequence = "knightWalk"
		jumpSequence = "knightJump"
		fallSequence = "knightDown"
	else
		runSequence = "princessRun"
		jumpSequence = "princessJump"
		fallSequence = "princessFall"
	end
	walk()
end

local function spawn(group)
	sprite = display.newSprite( group, myImageSheet, sequenceData )
	table.insert(hero, sprite)
	sprite.x = xyManager.leftEdge(sprite, 50)
	sprite.y = xyManager.centreY(320)
	yMin = sprite.y
	sprite.myName = "hero"
	print(table.maxn(hero))
	changeSkin()
	setPos()
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
hero.die = die
hero.setSeq = setSeq
hero.getSeq = getSeq
hero.changeSkin = changeSkin

return hero
