function onUpdate(elapsed)

    setShaderFloat('ShaderCont','time',getSongPosition() / (stepCrochet * 8))
 
    IntensitySnow=getProperty('ShaderCont.y')
    AmountSnow=toInt(getProperty('ShaderCont.x'))
    setShaderFloat('ShaderCont','intensity',IntensitySnow)
    setShaderInt('ShaderCont','amount',AmountSnow)
end
function lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end

function onCreate()
    addHaxeLibrary('Application', 'lime.app')
    AmountSnow=100
    IntensitySnow=0.2
    makeLuaSprite("ShaderCont",nil,AmountSnow,IntensitySnow)

  


if shadersEnabled then
    runHaxeCode([[
        var shaderName = "snowfall";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        //game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.camHUD.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("ShaderCont").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        
        
        shader0.setFloat('intensity', 0.2);
        shader0.setInt('amount', 100);
        shader0.setFloat('time', 1);
    ]])
end
   

    runHaxeCode([[
   Application.current.window.title="]]..songName..'-'..difficultyName..[[";
   ]])
    
end
function onEvent(tag,v1,v2)
if tag =='SnowFall_amount' then
   doTweenX('Amount','ShaderCont',tonumber(v1),(tonumber(v2)*stepCrochet)/1000,'linear')

end
if tag =='SnowFall_intensity' then
   doTweenY('Intensity','ShaderCont',tonumber(v1),(tonumber(v2)*stepCrochet)/1000,'linear')

end
--130.435=stepCrochet
end
function onDestroy()
    runHaxeCode([[
        Application.current.window.title="Friday Night Funkin': Psych Engine";
        ]])
end
function toInt(float)
    if float<=math.floor(float)+0.5 then
        return math.floor(float)
    else
        return math.ceil(float)
    end
end