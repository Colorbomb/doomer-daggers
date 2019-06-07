function newobj(name,layer)
	local obj = {
		name = name, -- the object's name
		layer = layer, -- the draw layer
		hash = hashtagger(), -- generates a new hash
		update = nil,
		draw = nil,
		kill = function(self)
			kill_object(self)
		end,
	}

	table.insert(list.update,obj)
	table.insert(list.draw,obj)
	sortdrawlist()
	return obj
end

function kill_object(o)
	if o.update ~= nil then
		for i=1, #list.update do
			if list.update[i].hash == o.hash then
				print("ded")
				table.remove(list.update, i)
				break
			end
		end
	end
	if o.draw ~= nil then
		for i=1, #list.draw do
			if list.draw[i].hash == o.hash then
				table.remove(list.draw, i)
				break
			end
		end
	end
	
end

--[[
	
	Welcome to the newobj function! This is a very important function, as it's how you create objects!

	It has 4 input arguments:
	
	1). name 
		--The name of the object. A string. ex: "player", "Dog", ect.
	2). layer
		--The layer to be drawn on. Layers with lower values will be drawn first.
	3). updateq
		--Either 1 or 0. Determines if the object should be put in the update list. (does it have an update function?)
	4. drawq
		--Either 1 or 0. Determines if the object should be put in the draw list. (does it have a draw function?)


	For more info on how to create objects, see the example object file.



]]--