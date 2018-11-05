--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:7137a53a2abff02a3fdd696e7c87951d:039785da755538bd367e5eced2e1731a:79ed03b86e4d368b2e8abd7047c78b22$
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
            -- enemy
            x=1,
            y=1,
            width=133,
            height=160,

        },
        {
            -- enemyYellow
            x=1,
            y=163,
            width=133,
            height=160,

        },
        {
            -- greenDragon001
            x=113,
            y=325,
            width=110,
            height=81,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- greenDragon002
            x=1,
            y=412,
            width=110,
            height=73,

            sourceX = 0,
            sourceY = 3,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- greenDragon003
            x=113,
            y=408,
            width=110,
            height=73,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- greenDragon004
            x=1,
            y=325,
            width=110,
            height=85,

        },
        {
            -- greenDragon005
            x=113,
            y=408,
            width=110,
            height=73,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- greenDragon006
            x=1,
            y=412,
            width=110,
            height=73,

            sourceX = 0,
            sourceY = 3,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon001
            x=136,
            y=88,
            width=108,
            height=77,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon002
            x=136,
            y=250,
            width=106,
            height=73,

            sourceX = 2,
            sourceY = 3,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon003
            x=136,
            y=167,
            width=106,
            height=81,

            sourceX = 2,
            sourceY = 2,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon004
            x=136,
            y=1,
            width=108,
            height=85,

            sourceX = 1,
            sourceY = 0,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon005
            x=136,
            y=167,
            width=106,
            height=81,

            sourceX = 2,
            sourceY = 2,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon006
            x=136,
            y=250,
            width=106,
            height=73,

            sourceX = 2,
            sourceY = 3,
            sourceWidth = 110,
            sourceHeight = 85
        },
    },

    sheetContentWidth = 245,
    sheetContentHeight = 486
}

SheetInfo.frameIndex =
{

    ["enemy"] = 1,
    ["enemyYellow"] = 2,
    ["greenDragon001"] = 3,
    ["greenDragon002"] = 4,
    ["greenDragon003"] = 5,
    ["greenDragon004"] = 6,
    ["greenDragon005"] = 7,
    ["greenDragon006"] = 8,
    ["redDragon001"] = 9,
    ["redDragon002"] = 10,
    ["redDragon003"] = 11,
    ["redDragon004"] = 12,
    ["redDragon005"] = 13,
    ["redDragon006"] = 14,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
