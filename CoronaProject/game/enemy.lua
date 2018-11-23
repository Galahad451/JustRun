local enemy = {}

local xyManager = require("xyManager")

local sheetInfo = require("Sprites.enemyData")
local myImageSheet = graphics.newImageSheet( "Sprites/enemySheet.png", sheetInfo:getSheet() )

local sequenceData = {
	{name = "Red", frames = {1}},
	{name = "Yellow", frames = {2}},
	{name = "greenDragon", start = 3, count = 6, time = 400, loopCount = 0, loopDirection = "forward"},
	{name = "redDragon", start = 9, count = 6, time = 300, loopCount = 0, loopDirection = "forward"},
	{name = "santa", start = 9, count = 12, time = 400, loopCount = 0, loopDirection = "forward"},
	{name = "monk", start = 21, count = 18, time = 400, loopCount = 0, loopDirection = "forward"}
}

local enemyCollisionFilter = {categoryBits=2, maskBits=5}

local position

local function createEnemy(group, posX, numero, velLevel)
	if numero == 1 then
		local newEnemy = display.newSprite(group, myImageSheet, sequenceData )
		newEnemy:setSequence("santa")
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
		newEnemy:setSequence("monk")
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
		newEnemy:setSequence("greenDragon")
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
	end
end

enemy.create = createEnemy

return enemy