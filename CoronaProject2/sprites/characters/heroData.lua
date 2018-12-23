--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:b4a5ffc2000f0fe9b3248385dfab35e0:4c23bf6d53225faeee36eca35dac998a:46d664d09ac2dbdd1d6a8d3482879139$
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
            -- knightDown
            x=1,
            y=1,
            width=162,
            height=172,

            sourceX = 44,
            sourceY = 45,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- knightIdle
            x=817,
            y=351,
            width=108,
            height=158,

            sourceX = 68,
            sourceY = 46,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- knightJump
            x=1,
            y=175,
            width=146,
            height=160,

            sourceX = 50,
            sourceY = 40,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- knightWalk01
            x=149,
            y=175,
            width=118,
            height=160,

            sourceX = 67,
            sourceY = 46,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- knightWalk02
            x=927,
            y=351,
            width=98,
            height=160,

            sourceX = 74,
            sourceY = 44,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- knightWalk03
            x=513,
            y=1,
            width=120,
            height=158,

            sourceX = 66,
            sourceY = 46,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- knightWalk04
            x=1129,
            y=367,
            width=98,
            height=160,

            sourceX = 74,
            sourceY = 44,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- princessDie01
            x=435,
            y=339,
            width=90,
            height=170,

            sourceX = 61,
            sourceY = 8,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessDie02
            x=507,
            y=169,
            width=92,
            height=168,

            sourceX = 65,
            sourceY = 8,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessDie03
            x=315,
            y=689,
            width=92,
            height=164,

            sourceX = 70,
            sourceY = 10,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessDie04
            x=317,
            y=855,
            width=90,
            height=162,

            sourceX = 77,
            sourceY = 9,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessDie05
            x=785,
            y=511,
            width=92,
            height=166,

            sourceX = 64,
            sourceY = 3,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessDie06
            x=209,
            y=855,
            width=106,
            height=162,

            sourceX = 53,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessDie07
            x=269,
            y=175,
            width=124,
            height=152,

            sourceX = 42,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessDie08
            x=1863,
            y=129,
            width=140,
            height=132,

            sourceX = 29,
            sourceY = 27,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessDie09
            x=1131,
            y=129,
            width=150,
            height=108,

            sourceX = 15,
            sourceY = 59,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessDie10
            x=973,
            y=129,
            width=156,
            height=90,

            sourceX = 7,
            sourceY = 93,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessDie11
            x=807,
            y=129,
            width=164,
            height=92,

            sourceX = 3,
            sourceY = 103,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessDie12
            x=635,
            y=129,
            width=170,
            height=90,

            sourceX = 0,
            sourceY = 109,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessDie13
            x=635,
            y=129,
            width=170,
            height=90,

            sourceX = 0,
            sourceY = 109,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessDie14
            x=635,
            y=129,
            width=170,
            height=90,

            sourceX = 0,
            sourceY = 109,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessDie15
            x=635,
            y=129,
            width=170,
            height=90,

            sourceX = 0,
            sourceY = 109,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessFall01
            x=879,
            y=513,
            width=92,
            height=164,

            sourceX = 64,
            sourceY = 5,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessFall02
            x=973,
            y=517,
            width=92,
            height=166,

            sourceX = 63,
            sourceY = 4,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessFall03
            x=1067,
            y=529,
            width=92,
            height=166,

            sourceX = 62,
            sourceY = 5,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessFall04
            x=115,
            y=865,
            width=92,
            height=168,

            sourceX = 62,
            sourceY = 4,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessFall05
            x=611,
            y=855,
            width=92,
            height=166,

            sourceX = 62,
            sourceY = 5,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessFall06
            x=969,
            y=685,
            width=92,
            height=166,

            sourceX = 63,
            sourceY = 4,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJump01
            x=229,
            y=337,
            width=92,
            height=174,

            sourceX = 57,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJump02
            x=527,
            y=339,
            width=92,
            height=172,

            sourceX = 58,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJump03
            x=723,
            y=333,
            width=92,
            height=172,

            sourceX = 58,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJump04
            x=1327,
            y=383,
            width=92,
            height=172,

            sourceX = 59,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJump05
            x=1421,
            y=383,
            width=92,
            height=172,

            sourceX = 58,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJump06
            x=1515,
            y=385,
            width=92,
            height=172,

            sourceX = 58,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack01
            x=115,
            y=513,
            width=92,
            height=174,

            sourceX = 57,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack02
            x=115,
            y=689,
            width=92,
            height=174,

            sourceX = 56,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack03
            x=229,
            y=1019,
            width=92,
            height=174,

            sourceX = 55,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack04
            x=1609,
            y=385,
            width=90,
            height=174,

            sourceX = 55,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack05
            x=1701,
            y=385,
            width=90,
            height=174,

            sourceX = 54,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack06
            x=1793,
            y=385,
            width=90,
            height=174,

            sourceX = 53,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack07
            x=1885,
            y=383,
            width=90,
            height=174,

            sourceX = 54,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack08
            x=319,
            y=513,
            width=90,
            height=174,

            sourceX = 57,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack09
            x=1,
            y=337,
            width=116,
            height=174,

            sourceX = 59,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack10
            x=1,
            y=513,
            width=112,
            height=174,

            sourceX = 63,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack11
            x=1,
            y=689,
            width=112,
            height=172,

            sourceX = 63,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack12
            x=281,
            y=1,
            width=112,
            height=172,

            sourceX = 63,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack13
            x=165,
            y=1,
            width=114,
            height=172,

            sourceX = 61,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack14
            x=119,
            y=337,
            width=108,
            height=172,

            sourceX = 60,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessJumpAttack15
            x=621,
            y=333,
            width=100,
            height=172,

            sourceX = 58,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun01
            x=1063,
            y=697,
            width=92,
            height=166,

            sourceX = 66,
            sourceY = 10,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun02
            x=411,
            y=511,
            width=92,
            height=170,

            sourceX = 64,
            sourceY = 5,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun03
            x=323,
            y=1019,
            width=92,
            height=170,

            sourceX = 61,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun04
            x=505,
            y=513,
            width=92,
            height=168,

            sourceX = 60,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun05
            x=599,
            y=513,
            width=90,
            height=170,

            sourceX = 62,
            sourceY = 3,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun06
            x=409,
            y=689,
            width=90,
            height=170,

            sourceX = 63,
            sourceY = 6,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun07
            x=689,
            y=685,
            width=90,
            height=168,

            sourceX = 66,
            sourceY = 9,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun08
            x=705,
            y=1027,
            width=92,
            height=166,

            sourceX = 67,
            sourceY = 11,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun09
            x=595,
            y=685,
            width=92,
            height=168,

            sourceX = 67,
            sourceY = 9,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun10
            x=781,
            y=679,
            width=92,
            height=168,

            sourceX = 66,
            sourceY = 8,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun11
            x=691,
            y=507,
            width=92,
            height=170,

            sourceX = 64,
            sourceY = 5,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun12
            x=875,
            y=679,
            width=92,
            height=168,

            sourceX = 62,
            sourceY = 3,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun13
            x=891,
            y=1023,
            width=92,
            height=166,

            sourceX = 61,
            sourceY = 3,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun14
            x=417,
            y=991,
            width=90,
            height=170,

            sourceX = 62,
            sourceY = 3,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun15
            x=705,
            y=855,
            width=90,
            height=170,

            sourceX = 63,
            sourceY = 6,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun16
            x=797,
            y=849,
            width=92,
            height=168,

            sourceX = 64,
            sourceY = 9,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun17
            x=1077,
            y=1037,
            width=92,
            height=166,

            sourceX = 66,
            sourceY = 10,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRun18
            x=891,
            y=853,
            width=92,
            height=168,

            sourceX = 66,
            sourceY = 9,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack01
            x=1157,
            y=697,
            width=92,
            height=166,

            sourceX = 66,
            sourceY = 10,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack02
            x=501,
            y=683,
            width=92,
            height=170,

            sourceX = 64,
            sourceY = 5,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack03
            x=509,
            y=981,
            width=92,
            height=170,

            sourceX = 61,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack04
            x=985,
            y=865,
            width=92,
            height=168,

            sourceX = 60,
            sourceY = 2,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack05
            x=799,
            y=1019,
            width=90,
            height=170,

            sourceX = 62,
            sourceY = 3,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack06
            x=1079,
            y=865,
            width=90,
            height=170,

            sourceX = 63,
            sourceY = 6,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack07
            x=985,
            y=1035,
            width=90,
            height=168,

            sourceX = 66,
            sourceY = 9,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack08
            x=1171,
            y=865,
            width=92,
            height=166,

            sourceX = 67,
            sourceY = 11,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack09
            x=395,
            y=169,
            width=110,
            height=168,

            sourceX = 67,
            sourceY = 9,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack10
            x=117,
            y=1035,
            width=110,
            height=168,

            sourceX = 67,
            sourceY = 8,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack11
            x=1,
            y=863,
            width=112,
            height=170,

            sourceX = 65,
            sourceY = 5,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack12
            x=1,
            y=1035,
            width=114,
            height=168,

            sourceX = 63,
            sourceY = 3,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack13
            x=395,
            y=1,
            width=116,
            height=166,

            sourceX = 61,
            sourceY = 3,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack14
            x=323,
            y=339,
            width=110,
            height=170,

            sourceX = 62,
            sourceY = 3,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack15
            x=209,
            y=513,
            width=108,
            height=170,

            sourceX = 63,
            sourceY = 6,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack16
            x=209,
            y=685,
            width=104,
            height=168,

            sourceX = 65,
            sourceY = 9,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack17
            x=1027,
            y=349,
            width=100,
            height=166,

            sourceX = 67,
            sourceY = 10,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- princessRunAttack18
            x=1229,
            y=383,
            width=96,
            height=168,

            sourceX = 66,
            sourceY = 9,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying01
            x=1813,
            y=561,
            width=96,
            height=124,

            sourceX = 50,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying02
            x=1265,
            y=1071,
            width=94,
            height=126,

            sourceX = 56,
            sourceY = 37,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying03
            x=1515,
            y=559,
            width=92,
            height=124,

            sourceX = 63,
            sourceY = 37,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying04
            x=1555,
            y=1069,
            width=90,
            height=124,

            sourceX = 69,
            sourceY = 36,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying05
            x=409,
            y=861,
            width=96,
            height=128,

            sourceX = 53,
            sourceY = 28,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying06
            x=507,
            y=855,
            width=102,
            height=124,

            sourceX = 40,
            sourceY = 27,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying07
            x=1825,
            y=263,
            width=114,
            height=118,

            sourceX = 30,
            sourceY = 27,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying08
            x=601,
            y=221,
            width=122,
            height=110,

            sourceX = 23,
            sourceY = 43,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying09
            x=1263,
            y=557,
            width=124,
            height=100,

            sourceX = 23,
            sourceY = 61,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying10
            x=725,
            y=239,
            width=122,
            height=92,

            sourceX = 27,
            sourceY = 81,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying11
            x=1389,
            y=655,
            width=124,
            height=92,

            sourceX = 24,
            sourceY = 89,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying12
            x=1389,
            y=557,
            width=124,
            height=96,

            sourceX = 25,
            sourceY = 93,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying13
            x=1389,
            y=557,
            width=124,
            height=96,

            sourceX = 25,
            sourceY = 93,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying14
            x=1389,
            y=557,
            width=124,
            height=96,

            sourceX = 25,
            sourceY = 93,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardDying15
            x=1389,
            y=557,
            width=124,
            height=96,

            sourceX = 25,
            sourceY = 93,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardFall01
            x=1911,
            y=559,
            width=92,
            height=126,

            sourceX = 61,
            sourceY = 24,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardFall02
            x=1515,
            y=685,
            width=92,
            height=126,

            sourceX = 60,
            sourceY = 25,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardFall03
            x=1171,
            y=1033,
            width=92,
            height=128,

            sourceX = 60,
            sourceY = 23,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardFall04
            x=1251,
            y=681,
            width=92,
            height=128,

            sourceX = 60,
            sourceY = 23,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardFall05
            x=1265,
            y=811,
            width=92,
            height=128,

            sourceX = 60,
            sourceY = 23,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardFall06
            x=1265,
            y=941,
            width=92,
            height=128,

            sourceX = 60,
            sourceY = 23,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJump01
            x=1609,
            y=561,
            width=100,
            height=124,

            sourceX = 39,
            sourceY = 28,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJump02
            x=1711,
            y=561,
            width=100,
            height=124,

            sourceX = 39,
            sourceY = 28,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJump03
            x=1609,
            y=687,
            width=100,
            height=124,

            sourceX = 40,
            sourceY = 28,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJump04
            x=1711,
            y=687,
            width=100,
            height=124,

            sourceX = 41,
            sourceY = 28,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJump05
            x=1813,
            y=687,
            width=100,
            height=124,

            sourceX = 40,
            sourceY = 28,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJump06
            x=1359,
            y=749,
            width=100,
            height=124,

            sourceX = 39,
            sourceY = 28,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJumpAttack01
            x=1359,
            y=875,
            width=100,
            height=124,

            sourceX = 39,
            sourceY = 28,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJumpAttack02
            x=1461,
            y=813,
            width=98,
            height=126,

            sourceX = 45,
            sourceY = 26,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJumpAttack03
            x=1683,
            y=1,
            width=144,
            height=126,

            sourceX = 49,
            sourceY = 26,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJumpAttack04
            x=849,
            y=223,
            width=138,
            height=126,

            sourceX = 55,
            sourceY = 26,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJumpAttack05
            x=1689,
            y=257,
            width=134,
            height=126,

            sourceX = 61,
            sourceY = 26,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJumpAttack06
            x=1413,
            y=255,
            width=136,
            height=126,

            sourceX = 58,
            sourceY = 26,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJumpAttack07
            x=1551,
            y=257,
            width=136,
            height=126,

            sourceX = 58,
            sourceY = 26,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJumpAttack08
            x=1273,
            y=255,
            width=138,
            height=126,

            sourceX = 56,
            sourceY = 26,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJumpAttack09
            x=989,
            y=221,
            width=140,
            height=126,

            sourceX = 54,
            sourceY = 26,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJumpAttack10
            x=1829,
            y=1,
            width=144,
            height=126,

            sourceX = 50,
            sourceY = 26,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJumpAttack11
            x=1091,
            y=1,
            width=146,
            height=126,

            sourceX = 46,
            sourceY = 26,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardJumpAttack12
            x=1283,
            y=129,
            width=146,
            height=124,

            sourceX = 42,
            sourceY = 28,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunAttack01
            x=1757,
            y=941,
            width=96,
            height=124,

            sourceX = 51,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunAttack02
            x=1861,
            y=813,
            width=96,
            height=126,

            sourceX = 51,
            sourceY = 37,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunAttack03
            x=1239,
            y=1,
            width=146,
            height=126,

            sourceX = 47,
            sourceY = 35,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunAttack04
            x=789,
            y=1,
            width=150,
            height=126,

            sourceX = 43,
            sourceY = 34,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunAttack05
            x=635,
            y=1,
            width=152,
            height=126,

            sourceX = 41,
            sourceY = 35,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunAttack06
            x=1387,
            y=1,
            width=146,
            height=126,

            sourceX = 47,
            sourceY = 37,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunAttack07
            x=1431,
            y=129,
            width=142,
            height=124,

            sourceX = 51,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunAttack08
            x=1131,
            y=239,
            width=140,
            height=126,

            sourceX = 53,
            sourceY = 37,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunAttack09
            x=1575,
            y=129,
            width=142,
            height=126,

            sourceX = 48,
            sourceY = 36,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunAttack10
            x=1535,
            y=1,
            width=146,
            height=126,

            sourceX = 44,
            sourceY = 34,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunAttack11
            x=941,
            y=1,
            width=148,
            height=126,

            sourceX = 41,
            sourceY = 36,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunAttack12
            x=1719,
            y=129,
            width=142,
            height=126,

            sourceX = 47,
            sourceY = 37,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunning01
            x=1855,
            y=941,
            width=96,
            height=124,

            sourceX = 51,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunning02
            x=1561,
            y=941,
            width=96,
            height=126,

            sourceX = 48,
            sourceY = 35,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunning03
            x=1561,
            y=941,
            width=96,
            height=126,

            sourceX = 48,
            sourceY = 35,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunning04
            x=1561,
            y=813,
            width=98,
            height=126,

            sourceX = 43,
            sourceY = 34,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunning05
            x=603,
            y=1023,
            width=100,
            height=126,

            sourceX = 41,
            sourceY = 35,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunning06
            x=1661,
            y=813,
            width=98,
            height=126,

            sourceX = 46,
            sourceY = 37,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunning07
            x=1361,
            y=1001,
            width=96,
            height=124,

            sourceX = 51,
            sourceY = 40,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunning08
            x=1459,
            y=1069,
            width=94,
            height=126,

            sourceX = 53,
            sourceY = 37,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunning09
            x=1659,
            y=941,
            width=96,
            height=126,

            sourceX = 48,
            sourceY = 36,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunning10
            x=1761,
            y=813,
            width=98,
            height=126,

            sourceX = 43,
            sourceY = 34,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunning11
            x=1161,
            y=553,
            width=100,
            height=126,

            sourceX = 41,
            sourceY = 36,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- wizardRunning12
            x=1461,
            y=941,
            width=98,
            height=126,

            sourceX = 46,
            sourceY = 37,
            sourceWidth = 200,
            sourceHeight = 200
        },
    },

    sheetContentWidth = 2004,
    sheetContentHeight = 1204
}

SheetInfo.frameIndex =
{

    ["knightDown"] = 1,
    ["knightIdle"] = 2,
    ["knightJump"] = 3,
    ["knightWalk01"] = 4,
    ["knightWalk02"] = 5,
    ["knightWalk03"] = 6,
    ["knightWalk04"] = 7,
    ["princessDie01"] = 8,
    ["princessDie02"] = 9,
    ["princessDie03"] = 10,
    ["princessDie04"] = 11,
    ["princessDie05"] = 12,
    ["princessDie06"] = 13,
    ["princessDie07"] = 14,
    ["princessDie08"] = 15,
    ["princessDie09"] = 16,
    ["princessDie10"] = 17,
    ["princessDie11"] = 18,
    ["princessDie12"] = 19,
    ["princessDie13"] = 20,
    ["princessDie14"] = 21,
    ["princessDie15"] = 22,
    ["princessFall01"] = 23,
    ["princessFall02"] = 24,
    ["princessFall03"] = 25,
    ["princessFall04"] = 26,
    ["princessFall05"] = 27,
    ["princessFall06"] = 28,
    ["princessJump01"] = 29,
    ["princessJump02"] = 30,
    ["princessJump03"] = 31,
    ["princessJump04"] = 32,
    ["princessJump05"] = 33,
    ["princessJump06"] = 34,
    ["princessJumpAttack01"] = 35,
    ["princessJumpAttack02"] = 36,
    ["princessJumpAttack03"] = 37,
    ["princessJumpAttack04"] = 38,
    ["princessJumpAttack05"] = 39,
    ["princessJumpAttack06"] = 40,
    ["princessJumpAttack07"] = 41,
    ["princessJumpAttack08"] = 42,
    ["princessJumpAttack09"] = 43,
    ["princessJumpAttack10"] = 44,
    ["princessJumpAttack11"] = 45,
    ["princessJumpAttack12"] = 46,
    ["princessJumpAttack13"] = 47,
    ["princessJumpAttack14"] = 48,
    ["princessJumpAttack15"] = 49,
    ["princessRun01"] = 50,
    ["princessRun02"] = 51,
    ["princessRun03"] = 52,
    ["princessRun04"] = 53,
    ["princessRun05"] = 54,
    ["princessRun06"] = 55,
    ["princessRun07"] = 56,
    ["princessRun08"] = 57,
    ["princessRun09"] = 58,
    ["princessRun10"] = 59,
    ["princessRun11"] = 60,
    ["princessRun12"] = 61,
    ["princessRun13"] = 62,
    ["princessRun14"] = 63,
    ["princessRun15"] = 64,
    ["princessRun16"] = 65,
    ["princessRun17"] = 66,
    ["princessRun18"] = 67,
    ["princessRunAttack01"] = 68,
    ["princessRunAttack02"] = 69,
    ["princessRunAttack03"] = 70,
    ["princessRunAttack04"] = 71,
    ["princessRunAttack05"] = 72,
    ["princessRunAttack06"] = 73,
    ["princessRunAttack07"] = 74,
    ["princessRunAttack08"] = 75,
    ["princessRunAttack09"] = 76,
    ["princessRunAttack10"] = 77,
    ["princessRunAttack11"] = 78,
    ["princessRunAttack12"] = 79,
    ["princessRunAttack13"] = 80,
    ["princessRunAttack14"] = 81,
    ["princessRunAttack15"] = 82,
    ["princessRunAttack16"] = 83,
    ["princessRunAttack17"] = 84,
    ["princessRunAttack18"] = 85,
    ["wizardDying01"] = 86,
    ["wizardDying02"] = 87,
    ["wizardDying03"] = 88,
    ["wizardDying04"] = 89,
    ["wizardDying05"] = 90,
    ["wizardDying06"] = 91,
    ["wizardDying07"] = 92,
    ["wizardDying08"] = 93,
    ["wizardDying09"] = 94,
    ["wizardDying10"] = 95,
    ["wizardDying11"] = 96,
    ["wizardDying12"] = 97,
    ["wizardDying13"] = 98,
    ["wizardDying14"] = 99,
    ["wizardDying15"] = 100,
    ["wizardFall01"] = 101,
    ["wizardFall02"] = 102,
    ["wizardFall03"] = 103,
    ["wizardFall04"] = 104,
    ["wizardFall05"] = 105,
    ["wizardFall06"] = 106,
    ["wizardJump01"] = 107,
    ["wizardJump02"] = 108,
    ["wizardJump03"] = 109,
    ["wizardJump04"] = 110,
    ["wizardJump05"] = 111,
    ["wizardJump06"] = 112,
    ["wizardJumpAttack01"] = 113,
    ["wizardJumpAttack02"] = 114,
    ["wizardJumpAttack03"] = 115,
    ["wizardJumpAttack04"] = 116,
    ["wizardJumpAttack05"] = 117,
    ["wizardJumpAttack06"] = 118,
    ["wizardJumpAttack07"] = 119,
    ["wizardJumpAttack08"] = 120,
    ["wizardJumpAttack09"] = 121,
    ["wizardJumpAttack10"] = 122,
    ["wizardJumpAttack11"] = 123,
    ["wizardJumpAttack12"] = 124,
    ["wizardRunAttack01"] = 125,
    ["wizardRunAttack02"] = 126,
    ["wizardRunAttack03"] = 127,
    ["wizardRunAttack04"] = 128,
    ["wizardRunAttack05"] = 129,
    ["wizardRunAttack06"] = 130,
    ["wizardRunAttack07"] = 131,
    ["wizardRunAttack08"] = 132,
    ["wizardRunAttack09"] = 133,
    ["wizardRunAttack10"] = 134,
    ["wizardRunAttack11"] = 135,
    ["wizardRunAttack12"] = 136,
    ["wizardRunning01"] = 137,
    ["wizardRunning02"] = 138,
    ["wizardRunning03"] = 139,
    ["wizardRunning04"] = 140,
    ["wizardRunning05"] = 141,
    ["wizardRunning06"] = 142,
    ["wizardRunning07"] = 143,
    ["wizardRunning08"] = 144,
    ["wizardRunning09"] = 145,
    ["wizardRunning10"] = 146,
    ["wizardRunning11"] = 147,
    ["wizardRunning12"] = 148,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
