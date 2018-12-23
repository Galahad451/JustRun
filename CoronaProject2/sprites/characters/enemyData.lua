--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:a97d014133ec2f351c7e0c3e6793ce9c:e04eb2ddd64962bdb2b8a89d6ff16b9d:79ed03b86e4d368b2e8abd7047c78b22$
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
            -- barrel
            x=967,
            y=261,
            width=118,
            height=124,

            sourceX = 5,
            sourceY = 2,
            sourceWidth = 128,
            sourceHeight = 128
        },
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
            -- fly01
            x=136,
            y=1,
            width=112,
            height=156,

            sourceX = 24,
            sourceY = 0,
            sourceWidth = 156,
            sourceHeight = 156
        },
        {
            -- fly02
            x=1,
            y=325,
            width=114,
            height=156,

            sourceX = 23,
            sourceY = 0,
            sourceWidth = 156,
            sourceHeight = 156
        },
        {
            -- fly03
            x=136,
            y=1,
            width=112,
            height=156,

            sourceX = 24,
            sourceY = 0,
            sourceWidth = 156,
            sourceHeight = 156
        },
        {
            -- fly04
            x=117,
            y=325,
            width=114,
            height=156,

            sourceX = 23,
            sourceY = 0,
            sourceWidth = 156,
            sourceHeight = 156
        },
        {
            -- greenBox
            x=930,
            y=135,
            width=120,
            height=124,

            sourceX = 4,
            sourceY = 2,
            sourceWidth = 128,
            sourceHeight = 128
        },
        {
            -- greenDragon001
            x=851,
            y=405,
            width=110,
            height=81,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- greenDragon002
            x=1675,
            y=245,
            width=110,
            height=73,

            sourceX = 0,
            sourceY = 3,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- greenDragon003
            x=1675,
            y=320,
            width=110,
            height=73,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- greenDragon004
            x=499,
            y=413,
            width=110,
            height=85,

        },
        {
            -- greenDragon005
            x=1675,
            y=320,
            width=110,
            height=73,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- greenDragon006
            x=1675,
            y=245,
            width=110,
            height=73,

            sourceX = 0,
            sourceY = 3,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- monk01
            x=1173,
            y=253,
            width=86,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk02
            x=1226,
            y=127,
            width=86,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk03
            x=1242,
            y=1,
            width=86,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk04
            x=1223,
            y=377,
            width=86,
            height=122,

            sourceX = 58,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk05
            x=1261,
            y=251,
            width=86,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk06
            x=1314,
            y=125,
            width=86,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk07
            x=1330,
            y=1,
            width=86,
            height=122,

            sourceX = 56,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk08
            x=1070,
            y=1,
            width=84,
            height=124,

            sourceX = 57,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk09
            x=1052,
            y=127,
            width=86,
            height=124,

            sourceX = 55,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk10
            x=1087,
            y=253,
            width=84,
            height=124,

            sourceX = 56,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk11
            x=1140,
            y=127,
            width=84,
            height=124,

            sourceX = 56,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk12
            x=1156,
            y=1,
            width=84,
            height=124,

            sourceX = 56,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk13
            x=1402,
            y=125,
            width=84,
            height=122,

            sourceX = 56,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk14
            x=1418,
            y=1,
            width=84,
            height=122,

            sourceX = 56,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk15
            x=1399,
            y=373,
            width=84,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk16
            x=1437,
            y=249,
            width=84,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk17
            x=1311,
            y=375,
            width=86,
            height=122,

            sourceX = 56,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- monk18
            x=1349,
            y=249,
            width=86,
            height=122,

            sourceX = 57,
            sourceY = 42,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- officer01
            x=136,
            y=159,
            width=90,
            height=156,

            sourceX = 28,
            sourceY = 0,
            sourceWidth = 156,
            sourceHeight = 156
        },
        {
            -- officer02
            x=228,
            y=159,
            width=90,
            height=156,

            sourceX = 26,
            sourceY = 0,
            sourceWidth = 156,
            sourceHeight = 156
        },
        {
            -- officer03
            x=250,
            y=1,
            width=90,
            height=156,

            sourceX = 24,
            sourceY = 0,
            sourceWidth = 156,
            sourceHeight = 156
        },
        {
            -- officer04
            x=228,
            y=159,
            width=90,
            height=156,

            sourceX = 26,
            sourceY = 0,
            sourceWidth = 156,
            sourceHeight = 156
        },
        {
            -- officer05
            x=136,
            y=159,
            width=90,
            height=156,

            sourceX = 28,
            sourceY = 0,
            sourceWidth = 156,
            sourceHeight = 156
        },
        {
            -- pumpkin01
            x=342,
            y=1,
            width=130,
            height=138,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 150,
            sourceHeight = 160
        },
        {
            -- pumpkin02
            x=367,
            y=305,
            width=130,
            height=138,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 150,
            sourceHeight = 160
        },
        {
            -- pumpkin03
            x=1488,
            y=125,
            width=150,
            height=120,

            sourceX = 0,
            sourceY = 17,
            sourceWidth = 150,
            sourceHeight = 160
        },
        {
            -- pumpkin04
            x=1504,
            y=1,
            width=150,
            height=120,

            sourceX = 0,
            sourceY = 16,
            sourceWidth = 150,
            sourceHeight = 160
        },
        {
            -- pumpkin05
            x=1485,
            y=373,
            width=150,
            height=120,

            sourceX = 0,
            sourceY = 17,
            sourceWidth = 150,
            sourceHeight = 160
        },
        {
            -- pumpkin06
            x=233,
            y=317,
            width=132,
            height=144,

            sourceX = 0,
            sourceY = 16,
            sourceWidth = 150,
            sourceHeight = 160
        },
        {
            -- pumpkin07
            x=320,
            y=159,
            width=132,
            height=144,

            sourceX = 0,
            sourceY = 16,
            sourceWidth = 150,
            sourceHeight = 160
        },
        {
            -- pumpkin08
            x=1523,
            y=247,
            width=150,
            height=120,

            sourceX = 0,
            sourceY = 17,
            sourceWidth = 150,
            sourceHeight = 160
        },
        {
            -- pumpkin09
            x=1640,
            y=123,
            width=150,
            height=120,

            sourceX = 0,
            sourceY = 19,
            sourceWidth = 150,
            sourceHeight = 160
        },
        {
            -- pumpkin10
            x=1071,
            y=387,
            width=150,
            height=122,

            sourceX = 0,
            sourceY = 15,
            sourceWidth = 150,
            sourceHeight = 160
        },
        {
            -- redDragon001
            x=1656,
            y=1,
            width=108,
            height=77,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon002
            x=1637,
            y=395,
            width=106,
            height=73,

            sourceX = 2,
            sourceY = 3,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon003
            x=963,
            y=403,
            width=106,
            height=81,

            sourceX = 2,
            sourceY = 2,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon004
            x=611,
            y=413,
            width=108,
            height=85,

            sourceX = 1,
            sourceY = 0,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon005
            x=963,
            y=403,
            width=106,
            height=81,

            sourceX = 2,
            sourceY = 2,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- redDragon006
            x=1637,
            y=395,
            width=106,
            height=73,

            sourceX = 2,
            sourceY = 3,
            sourceWidth = 110,
            sourceHeight = 85
        },
        {
            -- santa01
            x=853,
            y=269,
            width=112,
            height=132,

            sourceX = 40,
            sourceY = 16,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- santa02
            x=716,
            y=1,
            width=114,
            height=132,

            sourceX = 39,
            sourceY = 16,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- santa03
            x=737,
            y=271,
            width=114,
            height=132,

            sourceX = 39,
            sourceY = 16,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- santa04
            x=619,
            y=273,
            width=116,
            height=132,

            sourceX = 38,
            sourceY = 16,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- santa05
            x=499,
            y=277,
            width=118,
            height=134,

            sourceX = 36,
            sourceY = 14,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- santa06
            x=576,
            y=137,
            width=118,
            height=134,

            sourceX = 37,
            sourceY = 14,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- santa07
            x=454,
            y=141,
            width=120,
            height=134,

            sourceX = 35,
            sourceY = 14,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- santa08
            x=474,
            y=1,
            width=120,
            height=134,

            sourceX = 35,
            sourceY = 14,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- santa09
            x=596,
            y=1,
            width=118,
            height=134,

            sourceX = 37,
            sourceY = 14,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- santa10
            x=696,
            y=137,
            width=116,
            height=132,

            sourceX = 38,
            sourceY = 16,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- santa11
            x=814,
            y=135,
            width=114,
            height=132,

            sourceX = 39,
            sourceY = 16,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- santa12
            x=832,
            y=1,
            width=114,
            height=132,

            sourceX = 39,
            sourceY = 16,
            sourceWidth = 200,
            sourceHeight = 160
        },
        {
            -- spikes
            x=721,
            y=407,
            width=128,
            height=98,

        },
        {
            -- wall
            x=948,
            y=1,
            width=120,
            height=124,

            sourceX = 4,
            sourceY = 2,
            sourceWidth = 128,
            sourceHeight = 128
        },
    },

    sheetContentWidth = 1791,
    sheetContentHeight = 510
}

SheetInfo.frameIndex =
{

    ["barrel"] = 1,
    ["enemy"] = 2,
    ["enemyYellow"] = 3,
    ["fly01"] = 4,
    ["fly02"] = 5,
    ["fly03"] = 6,
    ["fly04"] = 7,
    ["greenBox"] = 8,
    ["greenDragon001"] = 9,
    ["greenDragon002"] = 10,
    ["greenDragon003"] = 11,
    ["greenDragon004"] = 12,
    ["greenDragon005"] = 13,
    ["greenDragon006"] = 14,
    ["monk01"] = 15,
    ["monk02"] = 16,
    ["monk03"] = 17,
    ["monk04"] = 18,
    ["monk05"] = 19,
    ["monk06"] = 20,
    ["monk07"] = 21,
    ["monk08"] = 22,
    ["monk09"] = 23,
    ["monk10"] = 24,
    ["monk11"] = 25,
    ["monk12"] = 26,
    ["monk13"] = 27,
    ["monk14"] = 28,
    ["monk15"] = 29,
    ["monk16"] = 30,
    ["monk17"] = 31,
    ["monk18"] = 32,
    ["officer01"] = 33,
    ["officer02"] = 34,
    ["officer03"] = 35,
    ["officer04"] = 36,
    ["officer05"] = 37,
    ["pumpkin01"] = 38,
    ["pumpkin02"] = 39,
    ["pumpkin03"] = 40,
    ["pumpkin04"] = 41,
    ["pumpkin05"] = 42,
    ["pumpkin06"] = 43,
    ["pumpkin07"] = 44,
    ["pumpkin08"] = 45,
    ["pumpkin09"] = 46,
    ["pumpkin10"] = 47,
    ["redDragon001"] = 48,
    ["redDragon002"] = 49,
    ["redDragon003"] = 50,
    ["redDragon004"] = 51,
    ["redDragon005"] = 52,
    ["redDragon006"] = 53,
    ["santa01"] = 54,
    ["santa02"] = 55,
    ["santa03"] = 56,
    ["santa04"] = 57,
    ["santa05"] = 58,
    ["santa06"] = 59,
    ["santa07"] = 60,
    ["santa08"] = 61,
    ["santa09"] = 62,
    ["santa10"] = 63,
    ["santa11"] = 64,
    ["santa12"] = 65,
    ["spikes"] = 66,
    ["wall"] = 67,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
