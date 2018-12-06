--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:960a70e433e5d2d8a028c8e9a011c39f:425b7c17de410f829bb31ededa3f2cdc:8a8d3d6094527962a07126b976b14785$
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
            -- back01
            x=1,
            y=1,
            width=1734,
            height=733,

            sourceX = 0,
            sourceY = 168,
            sourceWidth = 1734,
            sourceHeight = 901
        },
        {
            -- back02
            x=935,
            y=835,
            width=273,
            height=186,

        },
        {
            -- back03
            x=935,
            y=736,
            width=646,
            height=97,

            sourceX = 568,
            sourceY = 420,
            sourceWidth = 1734,
            sourceHeight = 901
        },
        {
            -- back04-1
            x=471,
            y=736,
            width=462,
            height=480,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 480,
            sourceHeight = 480
        },
        {
            -- back04-2
            x=1,
            y=736,
            width=468,
            height=480,

            sourceX = 5,
            sourceY = 0,
            sourceWidth = 480,
            sourceHeight = 480
        },
    },

    sheetContentWidth = 1736,
    sheetContentHeight = 1217
}

SheetInfo.frameIndex =
{

    ["back01"] = 1,
    ["back02"] = 2,
    ["back03"] = 3,
    ["back04-1"] = 4,
    ["back04-2"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
