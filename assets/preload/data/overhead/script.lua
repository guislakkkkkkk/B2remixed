local allowCountdown = false

enabled = true

function onCreate()
	addCharacterToList('whitty_cum', 'dad');
    addCharacterToList('shaya_cum', 'girlfriend');
	addCharacterToList('b3_cum', 'boyfriend');

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

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue

setStrumVisibilty(0,false)
setStrumVisibilty(1,false)
setStrumVisibilty(2,false)
setStrumVisibilty(3,false)
setStrumVisibilty(4,false)
setStrumVisibilty(5,false)
setStrumVisibilty(6,false)
setStrumVisibilty(7,false)
end
function onCreatePost()


setStrumVisibilty(0,false)
setStrumVisibilty(1,false)
setStrumVisibilty(2,false)
setStrumVisibilty(3,false)
setStrumVisibilty(4,false)
setStrumVisibilty(5,false)
setStrumVisibilty(6,false)
setStrumVisibilty(7,false)

end

function setStrumVisibilty(v1,vis)
		strum = v1
		strumset = 'opponentStrums'

		if strum > 3 then
			strumset = 'playerStrums'
		end
		
		strum = v1 % 4

		setPropertyFromGroup(strumset,strum,'visible',vis)
end

function onStepHit()
	if curStep == 512 or curStep == 1664 then
		enabled = true
		doTweenAngle('turn', 'camGame', 1.25, crochet/150, 'sineInOut')
		
	end

	if (curStep > 767 and curStep < 1151) or (curStep > 1407 and curStep < 1663) or (curStep > 1920 and curStep < 2432) then
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

	if curStep == 767 or curStep == 1920 then
		enabled = false
	end
end

function onTweenCompleted(t)
	if enabled then
		if t == 'turn' then
			doTweenAngle('turn1', 'camGame', -1.25, crochet/150, 'sineInOut')
		end
		if t == 'turn1' then
			doTweenAngle('turn', 'camGame', 1.25, crochet/150, 'sineInOut')
		end
	else
		doTweenAngle('turn3', 'camGame', 0, crochet/150, 'sineInOut')
	end
end

