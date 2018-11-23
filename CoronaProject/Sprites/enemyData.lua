--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:304f1941a23fec341221b873bc426efc:67333293c1e6d693cb570eeaf44ada69:79ed03b86e4d368b2e8abd7047c78b22$
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
            x=123,
            y=407,
            width=110,
            height=81,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- greenDragon002
            x=377,
            y=809,
            width=110,
            height=73,

            sourceX = 0,
            sourceY = 3,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- greenDragon003
            x=381,
            y=884,
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
            y=997,
            width=110,
            height=85,

        },
        {
            -- greenDragon005
            x=381,
            y=884,
            width=110,
            height=73,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- greenDragon006
            x=377,
            y=809,
            width=110,
            height=73,

            sourceX = 0,
            sourceY = 3,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- Idle_000
            x=136,
            y=273,
            width=112,
            height=132,

            sourceX = 40,
            sourceY = 16,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- Idle_001
            x=1,
            y=595,
            width=114,
            height=132,

            sourceX = 39,
            sourceY = 16,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- Idle_002
            x=374,
            y=137,
            width=114,
            height=132,

            sourceX = 39,
            sourceY = 16,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- Idle_003
            x=1,
            y=461,
            width=116,
            height=132,

            sourceX = 38,
            sourceY = 16,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- Idle_004
            x=136,
            y=137,
            width=118,
            height=134,

            sourceX = 36,
            sourceY = 14,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- Idle_005
            x=258,
            y=1,
            width=118,
            height=134,

            sourceX = 37,
            sourceY = 14,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- Idle_006
            x=136,
            y=1,
            width=120,
            height=134,

            sourceX = 35,
            sourceY = 14,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- Idle_007
            x=1,
            y=325,
            width=120,
            height=134,

            sourceX = 35,
            sourceY = 14,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- Idle_008
            x=378,
            y=1,
            width=118,
            height=134,

            sourceX = 37,
            sourceY = 14,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- Idle_009
            x=256,
            y=137,
            width=116,
            height=132,

            sourceX = 38,
            sourceY = 16,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- Idle_010
            x=1,
            y=729,
            width=114,
            height=132,

            sourceX = 39,
            sourceY = 16,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- Idle_011
            x=1,
            y=863,
            width=114,
            height=132,

            sourceX = 39,
            sourceY = 16,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- PIdle_000
            x=117,
            y=973,
            width=86,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_001
            x=203,
            y=577,
            width=86,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_002
            x=203,
            y=701,
            width=86,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_003
            x=203,
            y=825,
            width=86,
            height=122,

            sourceX = 58,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_004
            x=205,
            y=949,
            width=86,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_005
            x=235,
            y=407,
            width=86,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_006
            x=323,
            y=399,
            width=86,
            height=122,

            sourceX = 56,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_007
            x=250,
            y=273,
            width=84,
            height=124,

            sourceX = 57,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_008
            x=336,
            y=271,
            width=86,
            height=124,

            sourceX = 55,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_009
            x=117,
            y=595,
            width=84,
            height=124,

            sourceX = 56,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_010
            x=117,
            y=721,
            width=84,
            height=124,

            sourceX = 56,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_011
            x=117,
            y=847,
            width=84,
            height=124,

            sourceX = 56,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_012
            x=411,
            y=397,
            width=84,
            height=122,

            sourceX = 56,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_013
            x=291,
            y=531,
            width=84,
            height=122,

            sourceX = 56,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_014
            x=291,
            y=655,
            width=84,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_015
            x=291,
            y=779,
            width=84,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_016
            x=293,
            y=903,
            width=86,
            height=122,

            sourceX = 56,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- PIdle_017
            x=377,
            y=523,
            width=86,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- redDragon001
            x=377,
            y=730,
            width=108,
            height=77,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon002
            x=381,
            y=959,
            width=106,
            height=73,

            sourceX = 2,
            sourceY = 3,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon003
            x=377,
            y=647,
            width=106,
            height=81,

            sourceX = 2,
            sourceY = 2,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon004
            x=119,
            y=490,
            width=108,
            height=85,

            sourceX = 1,
            sourceY = 0,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon005
            x=377,
            y=647,
            width=106,
            height=81,

            sourceX = 2,
            sourceY = 2,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon006
            x=381,
            y=959,
            width=106,
            height=73,

            sourceX = 2,
            sourceY = 3,
            sourceWidth = 110,
            sourceHeight = 85
        },
    },

    sheetContentWidth = 497,
    sheetContentHeight = 1096
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
    ["Idle_000"] = 9,
    ["Idle_001"] = 10,
    ["Idle_002"] = 11,
    ["Idle_003"] = 12,
    ["Idle_004"] = 13,
    ["Idle_005"] = 14,
    ["Idle_006"] = 15,
    ["Idle_007"] = 16,
    ["Idle_008"] = 17,
    ["Idle_009"] = 18,
    ["Idle_010"] = 19,
    ["Idle_011"] = 20,
    ["PIdle_000"] = 21,
    ["PIdle_001"] = 22,
    ["PIdle_002"] = 23,
    ["PIdle_003"] = 24,
    ["PIdle_004"] = 25,
    ["PIdle_005"] = 26,
    ["PIdle_006"] = 27,
    ["PIdle_007"] = 28,
    ["PIdle_008"] = 29,
    ["PIdle_009"] = 30,
    ["PIdle_010"] = 31,
    ["PIdle_011"] = 32,
    ["PIdle_012"] = 33,
    ["PIdle_013"] = 34,
    ["PIdle_014"] = 35,
    ["PIdle_015"] = 36,
    ["PIdle_016"] = 37,
    ["PIdle_017"] = 38,
    ["redDragon001"] = 39,
    ["redDragon002"] = 40,
    ["redDragon003"] = 41,
    ["redDragon004"] = 42,
    ["redDragon005"] = 43,
    ["redDragon006"] = 44,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
