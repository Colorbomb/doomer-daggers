function create_camera()

	camera = {
		pos = {x = 0,y = 0},
		offset = 0,
		offsetangle = 0,
		angle = 0,
		fov = 90,
		update = function(self)
			--if you want camera controls, put them here
		end
	}

	table.insert(list.update, camera)

end

--[[
	Welcome to the create_camera function! This just creates the camera object. 
	All draw functions are drawn relative to the camera's position.
]]--