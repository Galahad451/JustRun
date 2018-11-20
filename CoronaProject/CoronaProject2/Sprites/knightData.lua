--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:afb66ba8b0780b5266da4c9ff53ad4c1:1fd8e342a590eba16998e3a2446d5fa5:e22100955f028b1c7df7e8ba09834a7c$
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
            -- 001
            x=755,
            y=1,
            width=108,
            height=158,

            sourceX = 68,
            sourceY = 46,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- 002
            x=313,
            y=1,
            width=118,
            height=160,

            sourceX = 67,
            sourceY = 46,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- 003
            x=433,
            y=1,
            width=98,
            height=160,

            sourceX = 74,
            sourceY = 44,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- 004
            x=633,
            y=1,
            width=120,
            height=158,

            sourceX = 66,
            sourceY = 46,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- 005
            x=533,
            y=1,
            width=98,
            height=160,

            sourceX = 74,
            sourceY = 44,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- 006
            x=165,
            y=1,
            width=146,
            height=160,

            sourceX = 50,
            sourceY = 40,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- 007
            x=1,
            y=1,
            width=162,
            height=172,

            sourceX = 44,
            sourceY = 45,
            sourceWidth = 250,
            sourceHeight = 250
        },
    },

    sheetContentWidth = 864,
    sheetContentHeight = 174
}

SheetInfo.frameIndex =
{

    ["001"] = 1,
    ["002"] = 2,
    ["003"] = 3,
    ["004"] = 4,
    ["005"] = 5,
    ["006"] = 6,
    ["007"] = 7,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
