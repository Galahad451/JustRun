local popUps = {}

local xyManager = require("system.xyManager")

local boxShadow	= display.newRect( -1000, -1000, display.contentWidth, display.contentHeight )
local creditBox = display.newImage( "sprites/img/creditos.png" , "sprites.img.creditos.png" , 0 , 0 )
creditBox.x = -1000
creditBox.y = -1000
creditBox:scale( 0.7, 0.7 )

popUps.creditsFlag = true

local function removeCredits()
	boxShadow.x = -1000
	boxShadow.y = -1000
	creditBox.x = -1000
	creditBox.y = -1000
	popUps.creditsFlag = true
end

local function spawnCredits()
	boxShadow.x = xyManager.centreX(0)
	boxShadow.y = xyManager.centreY(0)
	boxShadow:setFillColor( 0 , 0 , 0 , 0.5 )
	boxShadow:addEventListener( "tap", removeCredits )
	creditBox.x = xyManager.centreX(0)
	creditBox.y = xyManager.centreY(0)
	popUps.creditsFlag = false
end

popUps.spawnCredits = spawnCredits

return popUps