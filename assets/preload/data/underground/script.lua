local playerBop = true	

local bopStength = 12

local downToNega = 1

local relocatePosition = 571

note = true

timer = 0.5

function onCreatePost()
  playerRelocatePos = getPropertyFromGroup('strumLineNotes', direction,'y')
end

function directionProcessing(bopStength)

  return bopStength*downToNega
  
end

function onCreate()
	if getPropertyFromClass('Conductor', 'bpm') < 100 then
		timer = 0.5
	end
	if getPropertyFromClass('Conductor', 'bpm') > 100 and getPropertyFromClass('Conductor', 'bpm') < 155 then
		timer = 0.3
	end
	if getPropertyFromClass('Conductor', 'bpm') > 155 then
		timer = 0.15
	end
end

function onStepHit()
	if (curStep >= 703 and curStep <= 2016) then
		function onBeatHit()
			for i=3,0,-1 do
				opponentRelocatePos = getPropertyFromGroup('strumLineNotes', direction,'y')
				setPropertyFromGroup('strumLineNotes', i+0,'y',directionProcessing(bopStength)+opponentRelocatePos)
				noteTweenY('opponentBop'..i, i+0, opponentRelocatePos, 0.15,"circInOut")
			end
			for i = 1,4 do
				setPropertyFromGroup('strumLineNotes', i+3,'y',directionProcessing(bopStength)+playerRelocatePos)
				noteTweenY('playerBop'..i, i+3,playerRelocatePos, 0.15,"circInOut")
			end
		end
	end
end