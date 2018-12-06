local xyManager = {}

------ Variables for relocation -------
local topInset, leftInset, bottomInset, rightInset = display.getSafeAreaInsets()
xyManager.bottomInset = bottomInset


--local contentWidth = display.actualContentWidth
local contentWidth = display.contentWidth
xyManager.contentWidth = contentWidth

--local contentHeight = display.actualContentHeight 
local contentHeight = display.contentHeight
xyManager.contentHeight = contentHeight


local contentCenterX = display.contentCenterX
xyManager.contentCenterX = contentCenterX

local contentCenterY = display.contentCenterY
xyManager.contentCenterY = contentCenterY

---------------------------------------

------ Relocation functions -----------

function xyManager.centreX(offset)
		x =  contentCenterX + offset
		return x
	end

function xyManager.centreY( offset )
	y =  contentCenterY + offset
	return y
end

function xyManager.leftEdge( object, offset )
	x = object.width * .5 + offset + leftInset
	return x
end

function xyManager.rightEdge ( object, offset )
	x = contentWidth -(object.width *.5) - offset - rightInset
	return x
end

function xyManager.topEdge (object, offset) 
	y = (object.height * .5) + offset + topInset
	return y
end

function xyManager.bottomEdge (object, offset) 
	y = contentHeight - (object.height * .5) - offset - bottomInset
	return y
end

function xyManager.safeLeftX(object, offset)
	x = contentCenterX + offset - 1200/2 + (object.width/2)
	return x
end



function xyManager.safeBottomY(object, offset)
	y = contentCenterY -offset + 800/2 - (object.height/2)
	return y
end

function xyManager.safeArea()
	
	local safeArea = display.newRect(
    display.screenOriginX + leftInset, 
    display.screenOriginY + topInset, 
    display.actualContentWidth - ( leftInset + rightInset ), 
    display.actualContentHeight - ( topInset + bottomInset )
	)

safeArea:translate( safeArea.width*0.5, safeArea.height*0.5 )

end
---------------------------------------

---------------------------------------
return xyManager