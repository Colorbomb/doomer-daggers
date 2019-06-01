function circle3D(input_mode,input_x,input_y,input_z,input_radius,input_color)
	local mode = input_mode
	local field = .13/120
	local flat = 120/.13
	local color = input_color
	local angle = math.atan2((input_y-camera.pos.y),(input_x-camera.pos.x))
	local anglediff = -math.deg(camera.angle - angle)
	local actualdist = dist(camera.pos.x,camera.pos.y,input_x,input_y)
	local distance = (dist(camera.pos.x,camera.pos.y,input_x,input_y))*field*math.cos(math.rad(anglediff))
	local x = 0

	if anglediff > 180 then
		anglediff = anglediff - 360
	end

	x = s.w2 + s.w*(anglediff/camera.fov)*(1 + .001/distance)
	local y = s.h2
	local size = input_radius/distance
	local subs = 32




	love.graphics.setColor(color)
	love.graphics.circle(mode,x,y,size,subs)
end