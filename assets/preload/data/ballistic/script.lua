local allowCountdown = false
local stops = 0
local endstops = 0

function onCreate()
    makeLuaSprite('overlay', 'empty', -400, 0)
	makeGraphic('overlay', 1280, 720, '000000')
    scaleObject('overlay',3.5,3.5);
	setObjectCamera('overlay', 'game')
	setProperty('overlay.alpha', 1)
	addLuaSprite('overlay', true)

    makeLuaSprite('overlay2', 'empty', -400, 0)
	makeGraphic('overlay2', 1280, 720, '000000')
    scaleObject('overlay2',3.5,3.5);
	setObjectCamera('overlay2', 'game')
	setProperty('overlay2.alpha', 1)
    setObjectOrder('overlay2',1)
	addLuaSprite('overlay2', true)
end

function onSongStart()
	doTweenAlpha('lighter','overlay',0,1)
    doTweenAlpha('lighter2','overlay2',0,2)
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
end

function onEndSong()

        endstops = endstops + 1
        if isStoryMode then
            if endstops == 1 then
                
                
			     runTimer('endshit',1)
			    cameraFade('hud','000000',1)
                
                return Function_Stop;
                
            end
        end
         return Function_Continue;

end
function onUpdatePost()
    
   
    if endstops == 1 and getProperty('endingSong') then
       
    	endSong()
        
    end
    
    
end

function onStepHit()
	if ((curStep >= 0 and curStep <= 127) or (curStep >= 1024 and curStep <= 1536) or (curStep >= 1696 and curStep <= 1952)) then
		function opponentNoteHit()
			health = getProperty('health')
			if getProperty('health') > 0.6 then
				setProperty('health', health- 0.03);
			end
		end
	else
		function opponentNoteHit()
			health = getProperty('health')
			if getProperty('health') > 0.2 then
				setProperty('health', health- 0.001);
			end
		end	
	end
end


function onCreatePost()
	

	if not lowQuality then
	addLuaScript('epicScripts/infishake')


	addLuaScript('epicScripts/cam')
	end
end
    