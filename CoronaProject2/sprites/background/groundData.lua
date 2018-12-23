--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:31ab8808b28778a2f661a697a9fe50a6:409516391866c405d7a50ca9ae8ec971:a19c29aff3555859884b420647c2b11b$
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
            -- ground01
            x=1,
            y=113,
            width=1800,
            height=80,

        },
        {
            -- ground02
            x=1,
            y=195,
            width=1800,
            height=80,

        },
        {
            -- ground03
            x=1,
            y=277,
            width=1800,
            height=80,

        },
        {
            -- ground04
            x=1,
            y=1,
            width=1800,
            height=110,

        },
    },

    sheetContentWidth = 1802,
    sheetContentHeight = 358
}

SheetInfo.frameIndex =
{

    ["ground01"] = 1,
    ["ground02"] = 2,
    ["ground03"] = 3,
    ["ground04"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
