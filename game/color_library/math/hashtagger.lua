function hashtagger()
	local hashh = 0
	local yikes = 0

	repeat
		hashh = math.random(100000000)
		for i=1, #list.update do
			if hashh == list.update[i].hash then
				yikes = 1
				break
			end
		end
		if yikes == 0 then
			for i=1, #list.draw do
				if hashh == list.draw[i].hash then
					yikes = 1
					break
				end
			end
		end
	until yikes == 0


	return hashh
end

--[[
	Welcome to the hashtagger function! This function creates a unique integer hash for each object.
	This is useful for identifying objects in tables.
]]--