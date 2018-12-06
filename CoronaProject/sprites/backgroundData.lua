--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:5508dd848dd59f37a99eab703dedaadb:9c215dcfde4bf5810cdecba165ecd8df:9d51efe37442f3f71e8974fca3e8e298$
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
            -- cloudClose
            x=1727,
            y=180,
            width=199,
            height=96,

        },
        {
            -- cloudFar
            x=1727,
            y=278,
            width=124,
            height=56,

        },
        {
            -- cloudMiddle
            x=1727,
            y=84,
            width=232,
            height=94,

        },
        {
            -- gnd
            x=1,
            y=1,
            width=2000,
            height=81,

        },
        {
            -- mountains
            x=1,
            y=987,
            width=863,
            height=252,

        },
        {
            -- sky
            x=1,
            y=84,
            width=1724,
            height=901,

        },
    },

    sheetContentWidth = 2048,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["cloudClose"] = 1,
    ["cloudFar"] = 2,
    ["cloudMiddle"] = 3,
    ["gnd"] = 4,
    ["mountains"] = 5,
    ["sky"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
