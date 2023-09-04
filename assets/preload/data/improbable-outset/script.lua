function onEvent()
    end

local defaultNotePos = {};
local angleshit = 1;
local anglevar = 1;

function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
end

function onStepHit()
    -- entire song beat
    if ((curStep >= 192 and curStep < 448) or (curStep >= 768 and curStep < 800) or (curStep >= 832 and curStep < 992) or (curStep >= 864 and curStep < 992)) and curStep % 8 == 0 then
        setProperty('fade.alpha', 0.85)
    end
    if ((curStep >= 480 and curStep < 736) or (curStep >= 992 and curStep < 1248)) and curStep % 4 == 0 then
        setProperty('fade.alpha', 0.85)
    end
    -- first single note screams
    if ((curStep == 736 or curStep == 750 or curStep == 754 or curStep == 760 or curStep == 762)) then
        setProperty('fade.alpha', 0.85)
    end
    if ((curStep == 800 or curStep == 805 or curStep == 814 or curStep == 817 or curStep == 824 or curStep == 827)) then
        setProperty('fade.alpha', 0.85)
    end
    -- second single note screams
    if ((curStep == 1248 or curStep == 1261 or curStep == 1266 or curStep == 1312 or curStep == 1318 or curStep == 1325)) then
        setProperty('fade.alpha', 0.85)
    end
    if ((curStep == 1328 or curStep == 1330)) then
        setProperty('fade.alpha', 0.85)
    end
    -- Tricky beats
    if ((curStep == 1376 or curStep == 1381 or curStep == 1388 or curStep == 1408 or curStep == 1414 or curStep == 1420)) then
        setProperty('fade.alpha', 0.90)
    end
    if ((curStep == 1440 or curStep == 1445 or curStep == 1451 or curStep == 1472 or curStep == 1478 or curStep == 1485)) then
        setProperty('fade.alpha', 0.95)
    end
    -- BF beats
    if ((curStep == 1504 or curStep == 1510 or curStep == 1515 or curStep == 1536 or curStep == 1541 or curStep == 1548)) then
        setProperty('fade.alpha', 0.90)
    end
    if ((curStep == 1568 or curStep == 1574 or curStep == 1580 or curStep == 1600 or curStep == 1605 or curStep == 1611)) then
        setProperty('fade.alpha', 0.95)
    end
end

function math.lerp(a, b, t)
    return (b - a) * t + a;
end
function math.invlerp(a, b, t)
    return (t - a) / (b - a);
end

function onUpdate()
    songPos = getPropertyFromClass('Conductor', 'songPosition');
    currentBeat = (songPos / 1000) * (bpm / 60)

    if getProperty('fade.alpha') > 0 then
        setProperty('fade.alpha', math.lerp(getProperty('fade.alpha'), 0, 0.055))
    end
end

function onCreatePost()
    makeLuaSprite('fade', 'redglow', 0, 0)
    setObjectCamera('fade', 'hud')
    --doTweenColor('deeznuts', 'fade', 'e605ff', 0.001, 'linear')
    --setProperty('fade.alpha', 0)
    addLuaSprite('fade', true)

    setProperty('fade.alpha', 0)
end