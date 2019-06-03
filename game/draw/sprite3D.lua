function sprite3D(input_sprite, input_quad, input_x, input_y, input_z, input_size, input_rotation,input_quadwidth,input_quadheight)

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

	local width = input_quadwidth
	local height = input_quadheight

	x = s.w2 - s.w*(anglediff/camera.fov)
	--x = s.w2 + s.w*math.sin((anglediff/camera.fov)*math.pi/2)
	local y = 0
	y = s.h2 + input_z/distance
	local size = (input_size)/(distance)--((dist(camera.pos.x,camera.pos.y,input_x,input_y))*field)




	love.graphics.setColor(1,1,1)
	if math.abs(anglediff) < (camera.fov*1.2)/2 and distance > .01 then
		--love.graphics.print(subs,x,y+10)
		love.graphics.draw(input_sprite,input_quad,x,y,input_rotation,size,size,width/2,height)
		--love.graphics.print(anglediff,0,0)
	end
end