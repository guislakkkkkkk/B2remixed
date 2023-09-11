function onCreate()
    makeLuaSprite('sky', 'bgs/tricky/sky', -1100, -1300);
    scaleObject('sky', 3, 3);
    addLuaSprite('sky', false);

    makeLuaSprite('light', 'bgs/tricky/light', -1100, -1300);
    scaleObject('light', 3, 3);
    addLuaSprite('light', false);

    makeLuaSprite('float', 'bgs/tricky/float', -1100, -1300);
    scaleObject('float', 3, 3);
    addLuaSprite('float', false);

    makeLuaSprite('back', 'bgs/tricky/backrock', -1100, -1300);
    scaleObject('back', 3, 3);
    addLuaSprite('back', false);

    makeLuaSprite('ground', 'bgs/tricky/ground', -1100, -1300);
    scaleObject('ground', 3, 3);
    addLuaSprite('ground', false);

    makeLuaSprite('sign', 'bgs/tricky/sign', -1100, -1300);
    scaleObject('sign', 3, 3);
    addLuaSprite('sign', true)
end