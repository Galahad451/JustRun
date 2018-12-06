--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:eb4fa4a61576ce5fb5cc80df2ba0dfe2:76851e59ae8b57bf55234f85a5a2dfc4:2c21954cdb773d7ec53fd3a09996a8d3$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- far01
            x=1,
            y=1784,
            width=1190,
            height=901,

            sourceX = 427,
            sourceY = 0,
            sourceWidth = 1734,
            sourceHeight = 901
        },
        {
            -- far02
            x=1,
            y=904,
            width=1734,
            height=607,

        },
        {
            -- far03
            x=1,
            y=1513,
            width=1734,
            height=269,

            sourceX = 0,
            sourceY = 560,
            sourceWidth = 1734,
            sourceHeight = 901
        },
        {
            -- far04
            x=1,
            y=1,
            width=1734,
            height=901,

        },
    },

    sheetContentWidth = 1736,
    sheetContentHeight = 2686
}

SheetInfo.frameIndex =
{

    ["far01"] = 1,
    ["far02"] = 2,
    ["far03"] = 3,
    ["far04"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
