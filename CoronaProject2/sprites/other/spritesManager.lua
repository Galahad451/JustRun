local spritesManager = {}

local sheetInfo = require("sprites.other.otherData")
local myImageSheet = graphics.newImageSheet( "sprites/other/otherSheet.png", sheetInfo:getSheet() )

local sequenceData = {
	{name = "explosion", start = 1, count = 15, time = 400, loopCount = 1, loopDirection = "forward"}
}

local explosion

local function spawnExplosion(x, y)
	local newExplosion = display.newSprite( myImageSheet, sequenceData )
	table.insert( spritesManager, newExplosion )
	newExplosion.x = x
	newExplosion.y = y
	newExplosion:setSequence( "explosion" )
	newExplosion:play( )
end

local function delete()
	for i = #spritesManager, 1, -1 do
		local thisExplosion = spritesManager[i]
		if (not thisExplosion.isPlaying) then
			display.remove( thisExplosion )
			table.remove( spritesManager, i )
		end
	end
end

spritesManager.spawnExplosion = spawnExplosion
spritesManager.delete = delete

return spritesManager