local groceries = 0

function onCreate()
    makeLuaSprite('target', 'bgs/whitty/targetwall', 200, 100);
    addLuaSprite('target', false);

    makeLuaSprite('items','bgs/whitty/items', 100, -90);
    setScrollFactor('items',0.95, 0.95);
    addLuaSprite('items', false);

    makeLuaSprite('reg', 'bgs/whitty/register', 200, 200);
    addLuaSprite('reg', true);

    setProperty('bf.group', false);
    setProperty('dad.group', true);

end

function vroommmmm()
    groceries = 1
    doTweenX('vrom','items',getProperty('items.x') + 8000,120)
end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'ohno' then
        groceries = 0
        setProperty('items.x', getProperty('items.x') - 12000)
        cancelTween('vrom')
    end

end

function onBeatHit()

    if groceries < 1 then
        vroommmmm()
        timer = 240
        runTimer('ohno',timer)
    end
end