--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:c5690195925716a1f0130af25171e17f:cdbc7309d2bae65995f014d19c0ce215:f66fb82d241586842184f1d19f6233c7$
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
            -- sky01
            x=1,
            y=1,
            width=1734,
            height=901,

        },
        {
            -- sky02
            x=1737,
            y=904,
            width=1724,
            height=901,

        },
        {
            -- sky03
            x=1,
            y=904,
            width=1734,
            height=901,

        },
        {
            -- sky04
            x=1737,
            y=1,
            width=1734,
            height=901,

        },
    },

    sheetContentWidth = 3472,
    sheetContentHeight = 1806
}

SheetInfo.frameIndex =
{

    ["sky01"] = 1,
    ["sky02"] = 2,
    ["sky03"] = 3,
    ["sky04"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
