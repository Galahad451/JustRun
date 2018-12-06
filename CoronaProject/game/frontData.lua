--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:a808a6d0dafad4ebab63a5962d1a9aaa:749a1202a23eb537396ceac632fccdc2:69b620ecf188b98f07f7499fbe405c3b$
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
            -- front01
            x=1,
            y=1,
            width=1442,
            height=901,

            sourceX = 187,
            sourceY = 0,
            sourceWidth = 1734,
            sourceHeight = 901
        },
        {
            -- front02
            x=1445,
            y=1,
            width=135,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 135,
            sourceHeight = 96
        },
        {
            -- front03
            x=1,
            y=904,
            width=1456,
            height=149,

            sourceX = 154,
            sourceY = 285,
            sourceWidth = 1734,
            sourceHeight = 901
        },
        {
            -- front04-1
            x=1445,
            y=161,
            width=124,
            height=62,

            sourceX = 2,
            sourceY = 2,
            sourceWidth = 128,
            sourceHeight = 64
        },
        {
            -- front04-2
            x=1445,
            y=95,
            width=110,
            height=64,

            sourceX = 10,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 64
        },
    },

    sheetContentWidth = 1581,
    sheetContentHeight = 1054
}

SheetInfo.frameIndex =
{

    ["front01"] = 1,
    ["front02"] = 2,
    ["front03"] = 3,
    ["front04-1"] = 4,
    ["front04-2"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
