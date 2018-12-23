--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:ce6b338fda11616719b590cdf493c6eb:c42977b125e92afd51e4f804b8419dee:4ec7d0275d8e91b66f9e6c6153eae084$
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
            -- explosion01
            x=847,
            y=113,
            width=56,
            height=78,

            sourceX = 70,
            sourceY = 80,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- explosion02
            x=487,
            y=115,
            width=76,
            height=88,

            sourceX = 61,
            sourceY = 70,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- explosion03
            x=759,
            y=113,
            width=86,
            height=98,

            sourceX = 51,
            sourceY = 60,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- explosion04
            x=1,
            y=1,
            width=182,
            height=180,

            sourceX = 0,
            sourceY = 17,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- explosion05
            x=369,
            y=1,
            width=116,
            height=146,

            sourceX = 33,
            sourceY = 37,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- explosion06
            x=185,
            y=1,
            width=182,
            height=180,

            sourceX = 7,
            sourceY = 15,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- explosion07
            x=903,
            y=1,
            width=96,
            height=110,

            sourceX = 55,
            sourceY = 48,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- explosion08
            x=689,
            y=1,
            width=106,
            height=110,

            sourceX = 45,
            sourceY = 48,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- explosion09
            x=797,
            y=1,
            width=104,
            height=110,

            sourceX = 54,
            sourceY = 48,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- explosion10
            x=487,
            y=1,
            width=100,
            height=112,

            sourceX = 58,
            sourceY = 46,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- explosion11
            x=589,
            y=1,
            width=98,
            height=112,

            sourceX = 60,
            sourceY = 46,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- explosion12
            x=565,
            y=115,
            width=98,
            height=84,

            sourceX = 60,
            sourceY = 45,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- explosion13
            x=665,
            y=115,
            width=92,
            height=84,

            sourceX = 59,
            sourceY = 45,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- explosion14
            x=1,
            y=183,
            width=52,
            height=14,

            sourceX = 79,
            sourceY = 46,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- explosion15
            x=1,
            y=199,
            width=12,
            height=8,

            sourceX = 117,
            sourceY = 48,
            sourceWidth = 200,
            sourceHeight = 200
        },
    },

    sheetContentWidth = 1000,
    sheetContentHeight = 212
}

SheetInfo.frameIndex =
{

    ["explosion01"] = 1,
    ["explosion02"] = 2,
    ["explosion03"] = 3,
    ["explosion04"] = 4,
    ["explosion05"] = 5,
    ["explosion06"] = 6,
    ["explosion07"] = 7,
    ["explosion08"] = 8,
    ["explosion09"] = 9,
    ["explosion10"] = 10,
    ["explosion11"] = 11,
    ["explosion12"] = 12,
    ["explosion13"] = 13,
    ["explosion14"] = 14,
    ["explosion15"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
