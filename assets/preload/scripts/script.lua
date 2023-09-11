--[[
CREDITS :yippee:

omotashi: Made the script (https://twitter.com/omotashii)
legole0: Helped me make the base script when I started from scratch (https://twitter.com/legole0)
Piggyfriend1792: The OG Script from the Monday Night Monsterin' Mod that I used for making the thing show up (https://twitter.com/piggyfriend1792)
DEAD SKULLXX: Requested me to add Artist and Charter Credits 
--]]



local songdata = {
--yes i used the pico week bc i didnt wanna interfere with the old version
    ['Lo-Fight'] = {
    'Lo-Fight', -- Song Name [1]
    'Tailer', -- Composer [2]
    '5', --  Length for onscreen [3]
    'Niffirg & Lem', -- Charter [4]
    },

    ['Overhead'] = {
        'Overhead',
        'Tacto & LiterallyNoOne',
        '3',
        'Flootena & Clover',
    },

    ['Ballistic'] = {
        'Ballistic',
        'Kreagato',
        '3',
        'Clover & Faid',
    },    

    ['Headache'] = {
    'Headache', -- Song Name [1]
    'Tacto', -- Composer [2]
    '5', --  Length for onscreen [3]
    'Niffirg', -- Charter [5]
    },

    ['nerves'] = {
        'Nerves',
        'LiterallyNoOne',
        '5',
        'Clover & Flootena',
    },

    ['release'] = {
        'Release',
        'Jabibixd & LiterallyNoOne',
        '5',
        'Clover & Flootena',
    },

    ['Fading'] = {
        'Fading',
        'Jabibixd',
        '5',
        'Faid',
    },

    ['Underground'] = {
        'Underground',
        'LiterallyNoOne',
        '5',
        'Faid, Clover, & Foxeru',
    },

    ['Bargain'] = {
        'Bargain',
        'LiterallyNoOne',
        '5',
        'Faid & Clover',
    },

    ['Lover'] = {
        'Lover',
        'Tailer',
        '5',
        'Flootena & Faid',
    },

    ['Animal'] = {
        'Animal',
        'Kreagato',
        '5',
        'Degen Dan & Lem',
    },

    ['Improbable-Outset'] = {
        '???',
        'Kreagato',
        '5',
        'Clover & Lem',
    }
    
-- Replace this data with your songs and the song composer. 
-- The song name in the [] MUST be the same song in the JSON file
-- The Next two are just string values, have fun :3
}

local offsetX = 10
local offsetY = 150
local objWidth = 500


function ifExists(table, valuecheck) -- This stupid function stops your game from throwing up errors when you play a main week song thats not in the Song Data Folder
    if table[valuecheck] then
        return true
    else
        return false
    end
end


function onCreatePost() -- This creates all the placeholder shit B) ((THIS PART OF THE SCRIPT WAS MADE BY PIGGY))
    luaDebugMode = true

    makeLuaSprite('creditBox', 'songcard', 0 - objWidth, offsetY)
    setObjectCamera('creditBox', 'other')
    addLuaSprite('creditBox', true)

    makeLuaText('creditTitle', 'PlaceholderTitle', objWidth, offsetX - objWidth, offsetY+25)
    setTextFont('creditTitle', 'Helvetica-BoldItalic.ttf')
    setTextSize('creditTitle', 55)
    setTextAlignment('creditTitle', 'left')
    setObjectCamera('creditTitle', 'other')
    addLuaText("creditTitle",true)

    makeLuaText('creditComposer', 'PlaceholderComposer', objWidth, offsetX - objWidth, offsetY+75)
    setTextFont('creditComposer', 'Helvetica-BoldItalic.ttf')
    setTextSize('creditComposer', 30)
    setTextAlignment('creditComposer', 'left')
    setObjectCamera('creditComposer', 'other')
    addLuaText("creditComposer",true)

    makeLuaText('creditCharter', 'PlaceholderCharter', objWidth, offsetX - objWidth, offsetY+108)
    setTextFont('creditCharter', 'Helvetica-BoldItalic.ttf')
    setTextSize('creditCharter', 20)
    setTextAlignment('creditCharter', 'left')
    setObjectCamera('creditCharter', 'other')
    addLuaText("creditCharter",true)

    -- If you dont NOT want the art and charter credits (or a mix of two), the value used in the old version is:
    -- offsetY+25 for creditTitle
    -- offsetY+80 for the other credit (be it Composer, Charting, or Art)
end


function onSongStart()

 songExists = ifExists(songdata, songName) -- Checks to see if song exists

 if songExists == true then
    local curSongTable = songdata[songName]
    setTextString('creditTitle', curSongTable[1]) -- Sets the actual things
    setTextString('creditComposer', curSongTable[2])
    setTextString('creditCharter', "Charted by "..curSongTable[4])

    --Tweens--
    doTweenX("creditBoxTween", "creditBox", getProperty("creditBox.x") + 400, 1, "expoOut")
    doTweenX("creditTitleTween", "creditTitle", getProperty("creditTitle.x") + 500, 1, "expoOut")
    doTweenX("creditComposerTween", "creditComposer", getProperty("creditComposer.x") + 500, 1, "expoOut")
    doTweenX("creditCharterTween", "creditCharter", getProperty("creditCharter.x") + 500, 1, "expoOut")
    runTimer("creditDisplay",curSongTable[3],1)
 else
    local curSongTable = songdata[songName]
    setTextString('creditTitle', curSongTable[1]) -- Sets the actual things
    setTextString('creditComposer', curSongTable[2])
    setTextString('creditCharter', "Charted by "..curSongTable[4])

    --Tweens--
    doTweenX("creditBoxTween", "creditBox", getProperty("creditBox.x") + 400, 1, "expoOut")
    doTweenX("creditTitleTween", "creditTitle", getProperty("creditTitle.x") + 500, 1, "expoOut")
    doTweenX("creditComposerTween", "creditComposer", getProperty("creditComposer.x") + 500, 1, "expoOut")
    doTweenX("creditCharterTween", "creditCharter", getProperty("creditCharter.x") + 500, 1, "expoOut")
    runTimer("creditDisplay",curSongTable[3],1)

 end
end

function onTimerCompleted(timerName)

    if timerName == "creditDisplay" then
        doTweenX("creditBoxTween", "creditBox", getProperty("creditBox.x") - 400, 0.5, "sineIn")
        doTweenX("creditTitleTween", "creditTitle", getProperty("creditTitle.x") - 500, 0.5, "sineIn")
        doTweenX("creditComposerTween", "creditComposer", getProperty("creditComposer.x") - 500, 0.5, "sineIn")
        doTweenX("creditCharterTween", "creditCharter", getProperty("creditCharter.x") - 500, 0.5, "sineIn")
    end

end
