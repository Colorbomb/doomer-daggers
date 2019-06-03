function circle3D(input_mode,input_x,input_y,input_z,input_radius,input_color)
	local pi = math.pi
	local mode = input_mode
	local field = .13/120
	local flat = 120/.13
	local color = input_color
	local angle = math.atan2((input_y-camera.pos.y),(input_x-camera.pos.x))--%(2*math.pi)
	local anglediff = camera.angle - angle
	local actualdist = dist(camera.pos.x,camera.pos.y,input_x,input_y)*field
	local distance = actualdist*math.cos(anglediff)
	local x = 0
	anglediff = math.deg(anglediff)
	if anglediff > 180 then
		anglediff = anglediff - 360
	elseif anglediff < -180 then
		anglediff = anglediff + 360	
	end



	x = s.w2 - s.w*(anglediff/camera.fov)
	--x = s.w2 + s.w*math.sin((anglediff/camera.fov)*math.pi/2)
	local y = 0
	y = s.h2 + input_z/distance
	local size = input_radius/distance
	local subs = math.floor(32*(1-.5*distance))
	if subs <= 3 then
		subs = 3
	end




	love.graphics.setColor(color)
	if math.abs(anglediff) < camera.fov/2 and distance > .0025 then
		--love.graphics.print(anglediff,x,y+10)
		love.graphics.circle(mode,x,y,size,subs)
	end
end


function printer3D(input_text,input_x,input_y,input_z)
	local pi = math.pi
	local field = .13/120
	local flat = 120/.13
	local angle = math.atan2((input_y-camera.pos.y),(input_x-camera.pos.x))--%(2*math.pi)
	local anglediff = camera.angle - angle
	local actualdist = dist(camera.pos.x,camera.pos.y,input_x,input_y)*field
	local distance = actualdist*math.cos(anglediff)
	local x = 0
	anglediff = math.deg(anglediff)
	if anglediff > 180 then
		anglediff = anglediff - 360
	elseif anglediff < -180 then
		anglediff = anglediff + 360	
	end



	x = s.w2 - s.w*(anglediff/camera.fov)
	--x = s.w2 + s.w*math.sin((anglediff/camera.fov)*math.pi/2)
	local y = 0
	y = s.h2 + input_z/distance
	--local size = input_radius/distance
	local subs = math.floor(32*(1-.5*distance))
	if subs <= 3 then
		subs = 3
	end

	if math.abs(anglediff) < camera.fov/2 and distance > .0025 then
		--love.graphics.print(anglediff,x,y+10)
		love.graphics.print(input_text,x,y)
	end
end