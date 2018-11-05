--calculate the aspect ratio of the device
local aspectRatio = display.pixelHeight / display.pixelWidth

application = 
{
   content = 
   {  
   	  	width = aspectRatio > 1.5 and 800 or math.floor( 1200 / aspectRatio ),
      	height = aspectRatio < 1.5 and 1200 or math.floor( 800 * aspectRatio ),
      	scale = "zoomEven",
      	fps = 60,
      	yAlign = "bottom"
    },
}