function onCreate()
    makeLuaSprite('sky', 'bgs/tricky/sky', -1100, -1300);
    scaleObject('sky', 1.5, 1.5);
    addLuaSprite('sky', false);

    makeLuaSprite('light', 'bgs/tricky/light', -1100, -1300);
    scaleObject('light', 1.5, 1.5);
    addLuaSprite('light', false);

    makeLuaSprite('float', 'bgs/tricky/float', -1100, -1300);
    scaleObject('float', 1.5, 1.5);
    addLuaSprite('float', false);

    makeLuaSprite('back', 'bgs/tricky/backrock', -1100, -1300);
    scaleObject('back', 1.5, 1.5);
    addLuaSprite('back', false);

    makeLuaSprite('ground', 'bgs/tricky/ground', -1100, -1300);
    scaleObject('ground', 1.5, 1.5);
    addLuaSprite('ground', false);

    makeLuaSprite('sign', 'bgs/tricky/sign', -1100, -1300);
    scaleObject('sign', 1.5, 1.5);
    addLuaSprite('sign', true)
end