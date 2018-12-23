local enemy = {}

local xyManager = require("system.xyManager")

local sheetInfo = require("sprites.characters.enemyData")
local myImageSheet = graphics.newImageSheet( "sprites/characters/enemySheet.png", sheetInfo:getSheet() )

local sequenceData = {
	{name = "barrel", frames = {1}},
	{name = "santa", start = 54, count = 12, time = 400, loopCount = 0, loopDirection = "forward"},
	{name = "spikes", frames = {66}},
	{name = "wall", frames = {60}},
	{name = "pumpkin", start = 38, count = 10, time = 400, loopCount = 0, loopDirection = "forward"}

}

local enemyCollisionFilter = {categoryBits=2, maskBits=5}

local position

local function createEnemy(group, posX, numero, velLevel)
	if numero == 1 then
		local newEnemy = display.newSprite(group, myImageSheet, sequenceData )
		newEnemy:setSequence("barrel")
		newEnemy:play()
		transition.to(newEnemy, {xScale = -1, time = 0})
		table.insert( enemy, newEnemy )
		newEnemy.x = display.contentWidth  + (1200/10)*posX
		newEnemy.y = xyManager.centreY(330)
		physics.addBody( newEnemy, "dynamic", {filter = enemyCollisionFilter} )
		newEnemy.myName = "enemyRed"
		newEnemy.gravityScale = 0
		newEnemy:setLinearVelocity( -500*velLevel, 0 )
		newEnemy.isSensor = true
	elseif numero == 2 then
		local newEnemy = display.newSprite(group, myImageSheet, sequenceData )
		newEnemy:setSequence("spikes")
		newEnemy:play()
		transition.to(newEnemy, {xScale = -1, time = 0})
		table.insert( enemy, newEnemy )
		newEnemy.x = display.contentWidth  + (1200/10)*posX
		newEnemy.y = xyManager.centreY(330)
		physics.addBody( newEnemy, "dynamic", {filter = enemyCollisionFilter} )
		newEnemy.myName = "enemyYellow"
		newEnemy.gravityScale = 0
		newEnemy:setLinearVelocity( -500*velLevel, 0 )
		newEnemy.isSensor = true
	elseif numero == 3 then
		local newEnemy = display.newSprite(group, myImageSheet, sequenceData)
		newEnemy:setSequence("pumpkin")
		table.insert( enemy, newEnemy )
		newEnemy.x = display.contentWidth + (1200/10)*posX
		newEnemy.y = 220
		physics.addBody( newEnemy, "dynamic", {filter = enemyCollisionFilter} )
		newEnemy.myName = "greenDragon"
		newEnemy.gravityScale = 0
		newEnemy:setLinearVelocity( -500*velLevel, 0 )
		newEnemy.isSensor = true
		newEnemy:play()
	elseif numero == 4 then
		local newEnemy = display.newSprite(group, myImageSheet, sequenceData)
		newEnemy:setSequence("redDragon")
		table.insert( enemy, newEnemy )
		newEnemy.x = display.contentWidth + (1200/10)*posX
		newEnemy.y = 220
		physics.addBody( newEnemy, "dynamic", {filter = enemyCollisionFilter} )
		newEnemy.myName = "redDragon"
		newEnemy.gravityScale = 0
		newEnemy:setLinearVelocity( -500*velLevel, 0 )
		newEnemy.isSensor = true
		newEnemy:play()
	elseif numero == 5 then
		local newEnemy = display.newSprite(group, myImageSheet, sequenceData )
		newEnemy:setSequence("santa")
		transition.to(newEnemy, {xScale = -1, time = 0})
		table.insert( enemy, newEnemy )
		newEnemy.x = display.contentWidth  + (1200/10)*posX
		newEnemy.y = xyManager.centreY(330)
		physics.addBody( newEnemy, "dynamic", {filter = enemyCollisionFilter} )
		newEnemy.myName = "tutorial"
		newEnemy.gravityScale = 0
		newEnemy:setLinearVelocity( -500*velLevel, 0 )
		newEnemy.isSensor = true
		newEnemy.alpha = 0
	end
end

enemy.create = createEnemy

return enemy