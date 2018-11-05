--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:149d3cfbaea21c9117faf2de5b2ec167:c52208dc857340a27bf56f72e4fc8670:990fc9f95c7b044a3f8f24061e83aab5$
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
            -- atk
            x=1,
            y=1,
            width=100,
            height=100,

        },
        {
            -- idle
            x=103,
            y=1,
            width=100,
            height=100,

        },
        {
            -- jump
            x=205,
            y=1,
            width=100,
            height=100,

        },
        {
            -- walk
            x=307,
            y=1,
            width=100,
            height=100,

        },
    },

    sheetContentWidth = 408,
    sheetContentHeight = 102
}

SheetInfo.frameIndex =
{

    ["atk"] = 1,
    ["idle"] = 2,
    ["jump"] = 3,
    ["walk"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
