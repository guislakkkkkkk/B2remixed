enabled = true

function onEvent()
    end

function onStepHit()
    -- entire song beat
    if ((curStep == 528) or (curStep == 1039)) then
        enabled = true
	    doTweenAngle('turn', 'camGame', 1.25, crochet/150, 'sineInOut')
    end
    if ((curStep == 784) or (curStep == 1167)) then
        enabled = false
    end
end

function math.lerp(a, b, t)
    return (b - a) * t + a;
end
function math.invlerp(a, b, t)
    return (t - a) / (b - a);
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