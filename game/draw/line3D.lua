function line3D(input_x1,input_y1,input_z1,input_x2,input_y2,input_z2,input_color)

	local field = .13/120
	local flat = 120/.13
	local color = input_color
	local angle1 = math.atan2((input_y1-camera.pos.y),(input_x1-camera.pos.x))%(2*math.pi)
	local angley1 = math.atan2((input_z1-camera.pos.z),math.cos(angle1)*(input_x1-camera.pos.x)+math.sin(angle1)*(input_y1-camera.pos.y))
	local anglediff1 = math.deg(camera.angle - angle1)
	local anglediffy1 = math.deg(camera.angle2 - angley1)
	local actualdist1 = dist(camera.pos.x,camera.pos.y,input_x1,input_y1)*field
	local distance1 = actualdist1*math.cos(math.rad(anglediff1))
	local x1 = 0



	local angle2 = math.atan2((input_y2-camera.pos.y),(input_x2-camera.pos.x))%(2*math.pi)
	local angley2 = math.atan2((input_z2-camera.pos.z),math.cos(angle2)*(input_x2-camera.pos.x)+math.sin(angle2)*(input_y2-camera.pos.y))
	local anglediff2 = math.deg(camera.angle - angle2)
	local anglediffy2 = math.deg(camera.angle2 - angley2)
	local actualdist2 = dist3D(camera.pos.x,camera.pos.y,camera.pos.z,input_x2,input_y2,input_z2)*field
	local distance2 = actualdist2*math.cos(math.rad(anglediff2))
	local x2 = 0

	if anglediff1 > 180 then
		anglediff1 = anglediff1 - 360
	elseif anglediff1 < -180 then
		anglediff1 = anglediff1 + 360	
	end

	if anglediff2 > 180 then
		anglediff2 = anglediff2 - 360
	elseif anglediff2 < -180 then
		anglediff2 = anglediff2 + 360	
	end
	local a = 1

	local b = math.sqrt(2)

	x1 = s.w2 - s.w*(anglediff1/camera.fov)*(-((b-a)/2)*math.cos(math.rad(anglediff1)*math.pi/math.rad(camera.fov))+(a+b)/2)

	--x1 = s.w2 - s.w*(anglediff1/camera.fov)
	--x1 = s.w2 - s.w*(anglediff1/camera.fov)*math.abs(1+.4*math.sin(math.rad(anglediff1))^2)
	--x1 = s.w2 + s.w*math.sin((anglediff1/camera.fov)*math.pi/2)
	local y1 = s.h2 + input_z1/(distance1) - s.h*(anglediffy1/camera.fov)*(-((b-a)/2)*math.cos(math.rad(anglediffy1)*math.pi/math.rad(camera.fov))+(a+b)/2)
	x2 = s.w2 - s.w*(anglediff2/camera.fov)*(-((b-a)/2)*math.cos(math.rad(anglediff2)*math.pi/math.rad(camera.fov))+(a+b)/2)
	--x2 = s.w2 - s.w*(anglediff2/camera.fov)*math.abs(1+.4*math.sin(math.rad(anglediff2))^2)
	--x2 = s.w2 - s.w*(anglediff2/camera.fov)
	--x2 = s.w2 + s.w*math.sin((anglediff2/camera.fov)*math.pi/2)
	local y2 = s.h2 + input_z2/(distance2) - s.h*(anglediffy2/camera.fov)*(-((b-a)/2)*math.cos(math.rad(anglediffy2)*math.pi/math.rad(camera.fov))+(a+b)/2)

	local color = input_color
	love.graphics.setColor(color)
	--if math.abs(anglediff1) < camera.fov and math.abs(anglediff2) < camera.fov and distance1 > .0025 and distance2 > .0025 then
		--love.graphics.print(anglediff2,x1,y1+10)
		love.graphics.line(x1,y1,x2,y2)
	--end
	










end