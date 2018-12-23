local hero = { }


local xyManager = require("system.xyManager")
local gameData = require("system.gameData")

local sheetInfo = require("sprites.characters.heroData")
local myImageSheet = graphics.newImageSheet( "sprites/characters/heroSheet.png", sheetInfo:getSheet() )
local physics = require("physics")

local heroCollisionFilter = {categoryBits=1, maskBits=6}
-- local heroCollisionFilter = {categoryBits=8, maskBits=16}

local sprite
local runSequence = "wizardRun"
local jumpSequence = "wizardJump"
local fallSequence = "wizardFall"
local runAttackSequence = "wizardRunAtk"
local jumpAttackSequence = "wizardJumpAtk"
local dieSequence = "wizardDie"

local sequenceData = {
	{	name = "knightWalk", start = 14, count = 4, time = 800, loopCount = 0, loopDirection = "forward"},
	{	name = "knightIdle", frames = { 12 }},
	{	name = "knightJump", frames = { 13 }},
	{	name = "knightDown", frames = { 11 }},
	{	name = "princessRun", start = 50, count = 18, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "princessJump", start = 29, count = 6, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "princessFall", start = 23, count = 6, time = 400, loopCount = 0, loopDirection = "forward"}, 
	{	name = "princessDie", start = 8, count = 15, time = 400, loopCount = 1, loopDirection = "forward"},
	{	name = "princessRunAtk", start = 68, count = 18, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "princessJumpAtk", start = 35, count = 15, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "wizardRun", start = 137, count = 12, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "wizardJump", start = 107, count = 6, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "wizardFall", start = 101, count = 6, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "wizardDie", start = 86, count = 15, time = 400, loopCount = 1, loopDirection = "forward"},
	{	name = "wizardRunAtk", start = 125, count = 12, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "wizardJumpAtk", start = 113, count = 12, time = 400, loopCount = 0, loopDirection = "forward"}
}

local yMin

local collision = true

local vx, vy

local function setPos()
	local skin = gameData.persistent.skin
	if skin == 2 then
		sprite.y = xyManager.centreY(335)
	else
		sprite.y = xyManager.centreY(335)
	end
end

local function down()
	if sprite.sequence == "wizardJump" then
		sprite:setSequence(fallSequence)
	end
	sprite:play()
	transition.cancel("heroCancel")
	transition.to( sprite, {time = 600, transition = easing.inExpo, x = sprite.x, y = xyManager.centreY(335), tag="heroMove"} )
end
local function jump()
	transition.cancel("heroCancel")
	transition.to( sprite, {time = 600, transition = easing.outExpo, onComplete=down, x = sprite.x, y = 201, tag="heroMove"} )
end

local function pause()
	transition.pause( "heroMove" )
	sprite:pause()
end

local function play()
	transition.resume( "heroMove" )
	sprite:play()
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

local function speedUp()
	hero.down()
	local function setBack()
		transition.to( sprite, {time = 1000, transition = easing.linear, x = sprite.x - 500, y = sprite.y} )
	end
	transition.to( sprite, {time = 1000, transition = easing.linear, x = sprite.x + 500, y = sprite.y, onComplete = setBack} )
	hero.down()
end

local function start()
	physics.addBody( sprite, {density=1.0, filter = heroCollisionFilter} )
	sprite.collision = onLocalCollision
	sprite.gravityScale = 0
end

local function delete()
	display.remove(sprite)
	table.remove(hero, 1)
end

local function die()
	sprite:setSequence(dieSequence)
	sprite:play()
	transition.to( sprite, {rotation=-900, time=500, transition=easing.linear, y = sprite.y - 100})
	transition.to( sprite, {rotation=-900, time=500, delay=500, transition=easing.inExpo, y = display.contentHeight + 200})
end

local function cancelJump()
	transition.cancel( "heroMove" )
	transition.to(sprite, {time = 100, transition = linear, x = sprite.x, y = xyManager.centreY(335), tag = "heroCancel"})
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
		runSequence = "wizardRun"
		jumpSequence = "wizardJump"
		fallSequence = "wizardFall"
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
hero.speedUp = speedUp
hero.pause = pause
hero.play = play

return hero
