local patrones = {}

local xyManager = require("xyManager")
local enemy = require("game.enemy")
local physics = require("physics")
local pattern = require("game.pattern")

local enemies = {}

local frames = {}

local bngCollisionFilter = { categoryBits=8, maskBits=16 }

local vel = -500

local random = 1

local function createPattern(group, enemies)
	for i=1,table.maxn(enemies) do
		if(enemies[i] == 1) then
			enemy.create(group, i, 1)
		elseif (enemies[i] == 2) then
			enemy.create(group, i, 2)
		elseif(enemies[i] == 3) then
			enemy.create(group, i, 3)
		elseif(enemies[i] == 4) then
			enemy.create(group, i, 4)
		end
	end
end

local function spawn(group)
	random = math.random(1, table.maxn(pattern[1]))
	enemies = pattern[1][random]
	createPattern(group, enemies)
	for i = #enemy, 1, -1 do
        local thisEnemy = enemy[i]
 
        if ( thisEnemy.x < -50 or
             thisEnemy.y < -50 or
             thisEnemy.y > display.contentHeight + 50 )
        then
            display.remove( thisEnemy )

            table.remove( enemy, i )
        end
    end

end

local function spawnFrame(group)
	local newFrame = display.newRect(0, 0, 1200, display.contentHeight )
	table.insert(frames, newFrame)
	newFrame.x = display.contentWidth + newFrame.width/2
	newFrame.y = xyManager.centreY(0)
	newFrame.myName = "frame"
	newFrame:setFillColor(0,0,0,0)
	physics.addBody( newFrame, "dynamic", {filter = bngCollisionFilter} )
	newFrame:setLinearVelocity( vel, 0 )
	newFrame.gravityScale = 0
	spawn(group)
end

local function delete()
	for i = #frames, 1, -1 do
		local thisFrame = frames[i]
		display.remove( thisFrame )
		table.remove( frames, i )
	end
	for i = #enemy, 1, -1 do
		local thisEnemy = enemy[i]
		display.remove( thisEnemy )
		table.remove( enemy, i )
	end
end

local function frameFunction(group)
	for i = #frames, 1, -1 do
		local thisFrame = frames[i]
		if(thisFrame.x + thisFrame.width/2 <= display.contentWidth - 100) then
			spawnFrame(group)
			display.remove ( thisFrame )
			table.remove( frames, i )
		end
	end
end

patrones.frames = frameFunction
patrones.spawn = spawn
patrones.getX = getX
patrones.spawnFrame = spawnFrame
patrones.delete = delete

return patrones