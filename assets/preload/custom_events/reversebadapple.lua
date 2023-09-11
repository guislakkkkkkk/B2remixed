function onEvent(name, value1, value2)
	if name == 'reversebadapple' and value1 == 'a' then
		makeLuaSprite('blackbg', '', -500, -300)
		makeGraphic('blackbg',5000,5000,'000000')
		addLuaSprite('blackbg', false)
		doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.25)
		oTweenAlpha('AlphaTween2', 'healthBar', 0, 0.25)
		doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.25)
		doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.25)
		doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.25)
	end
	if name == 'reversebadapple' and value1 == 'b' then
		removeLuaSprite('blackbg')
		doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.25)
		doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.25)
		doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.25)
		doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.25)
		doTweenAlpha('AlphaTween5', 'iconP2', 1, 0.25)
	end
end