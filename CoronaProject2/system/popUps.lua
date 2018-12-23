local popUps = {}

local xyManager = require("system.xyManager")
local fonts = require("system.fonts")
local movement = require("system.movement")

local boxShadow	= display.newRect( -1000, -1000, display.contentWidth, display.contentHeight )
local creditBox = display.newImage( "sprites/img/creditos.png" , "sprites.img.creditos.png" , 0 , 0 )
local hand = display.newImage( "sprites/img/tangan.png"  , 0, 0 )
creditBox.x = -1000
creditBox.y = -1000
hand.x = -1000
hand.y = -1000
creditBox:scale( 0.7, 0.7 )

popUps.creditsFlag = true

local function removeCredits()
	boxShadow.x = -1000
	boxShadow.y = -1000
	creditBox.x = -1000
	creditBox.y = -1000
	popUps.creditsFlag = true
	boxShadow:removeEventListener( "rap", removeCredits )
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

local function spawnTutorial(number)
	transition.cancel( "tutorial" )
	hand.rotation = -60
	local i, e
	local function moveUp()
		hand.x = xyManager.centreX(300)
		hand.y = xyManager.centreY(300)
		transition.to( hand, i )
	end
	local function moveDown()
		hand.x = xyManager.centreX(300)
		hand.y = xyManager.centreY(-300)
		transition.to( hand, e )
	end

	i = {time = 1500, x = xyManager.centreX(400), y = xyManager.centreY(-200), transition = easing.outQuad, onComplete = moveUp, tag = "tutorial"}
	e = {time = 1500, x = xyManager.centreX(400), y = xyManager.centreY(200), transition = easing.outQuad, onComplete = moveDown, tag = "tutorial"}

	if (number == 1) then
		hand.x = xyManager.centreX(300)
		hand.y = xyManager.centreY(300)
		boxShadow.x = xyManager.centreX(0)
		boxShadow.y = xyManager.centreY(0)
		boxShadow:setFillColor( 0,0,0,0.5 )
		moveUp()
	elseif (number == 2) then
		hand.x = xyManager.centreX(300)
		hand.y = xyManager.centreY(-300)
		boxShadow.x = xyManager.centreX(0)
		boxShadow.y = xyManager.centreY(0)
		boxShadow:setFillColor( 0,0,0,0.5 )
		moveDown()
	elseif (number == 3) then
		hand.x = xyManager.centreX(300)
		hand.y = xyManager.centreY(0)
		boxShadow.x = xyManager.centreX(0)
		boxShadow.y = xyManager.centreY(0)
		boxShadow:setFillColor( 0,0,0,0.5 )
		movement.breath(hand, 0.2, 200 )
	end

end

local function removeTutorial()
	transition.cancel("tutorial")
	hand.x = display.contentWidth + 1000
	hand.y = display.contentHeight + 1000
	boxShadow.x = display.contentWidth + 1000
	boxShadow.y = display.contentHeight + 1000
end


popUps.spawnCredits = spawnCredits
popUps.spawnTutorial = spawnTutorial
popUps.removeTutorial = removeTutorial

return popUps