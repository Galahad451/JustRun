--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:1153acf346d28cd6e7956d1b57359100:cb7fe44671ed538dfb90917eca4958fc:b1dd71b7530b7bd6a2dcaa000a4cbdea$
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
            -- sword
            x=1,
            y=1,
            width=181,
            height=76,

        },
    },

    sheetContentWidth = 183,
    sheetContentHeight = 78
}

SheetInfo.frameIndex =
{

    ["sword"] = 1,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
