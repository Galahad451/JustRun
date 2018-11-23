local hero = { }


local xyManager = require("xyManager")

local sheetInfo = require("Sprites.ninjaData")
local myImageSheet = graphics.newImageSheet( "Sprites/ninjaSheet.png", sheetInfo:getSheet() )
local physics = require("physics")

local swordSheetInfo = require("Sprites.swordData")
local mySwordSheet = graphics.newImageSheet( "Sprites/swordSheet.png", sheetInfo:getSheet() )


local heroCollisionFilter = {categoryBits=1, maskBits=6}
--local heroCollisionFilter = {categoryBits=8, maskBits=16}

local sprite
local swordSprite

local sequenceData = {
	{	name = "walk", start = 2, count = 4, time = 800, loopCount = 0, loopDirection = "forward"},
	{	name = "idle", frames = { 1 }},
	{	name = "jump", frames = { 6 }},
	{	name = "down", frames = { 7 }},
	{	name = "princessRun", start = 35, count = 18, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "princessJump", start = 29, count = 6, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "princessFall", start = 23, count = 6, time = 400, loopCount = 0, loopDirection = "forward"}, 
	{	name = "princessDie", start = 8, count = 15, time = 400, loopCount = 1, loopDirection = "forward"},
	{	name = "princessRunAtk", start = 53, count = 18, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "princessJumpAtk", start = 83, count = 15, time = 400, loopCount = 0, loopDirection = "forward"},
	{	name = "ninjaRun", start = 26, count = 12, time = 400, loopCount = 0, loopDirection = "forward"}
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
	if sprite.sequence == "princessJump" then
		sprite:setSequence("princessFall")
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
	sprite:setSequence( "princessRun" )
	sprite:play()
end
local function idle()
	sprite:setSequence( "idle" )
end
local function atk(seq)
	if seq == 1 then
		sprite:setSequence( "princessRunAtk" )
	else
		sprite:setSequence(	"princessJumpAtk" )
	end
	sprite:play()
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

local function die()
	sprite:setSequence("princessDie")
	sprite:play()
	transition.to( sprite, {rotation=-900, time=500, transition=easing.linear, y = sprite.y - 100})
	transition.to( sprite, {rotation=-900, time=500, delay=500, transition=easing.inExpo, y = display.contentHeight + 200})
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

local function setSeq(number)
	if number == 1 then
		sprite:setSequence("princessRun")
	elseif number == 2 then
		sprite:setSequence("princessJump")
	elseif number == 3 then
		sprite:setSequence("princessRunAtk")
	elseif number == 4 then
		sprite:setSequence("princessJumpAtk")
	elseif number == 5 then
		sprite:setSequence("princessFall")
	end
	sprite:play()
end

local function getSeq()
	return sprite.sequence
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

return hero
