function circle3D(input_mode,input_x,input_y,input_z,input_radius,input_color)
	local pi = math.pi
	local mode = input_mode
	local field = .13/120
	local flat = 120/.13
	local color = input_color
	local angle = math.atan2((input_y-camera.pos.y),(input_x-camera.pos.x))--%(2*math.pi)
	local angley = math.atan2((input_z-camera.pos.z),math.cos(angle)*(input_x-camera.pos.x)+math.sin(angle)*(input_y-camera.pos.y))--%(2*math.pi)
	local anglediff = camera.angle - angle
	local anglediffy = camera.angle2 - angley
	local actualdist = dist(camera.pos.x,camera.pos.y,input_x,input_y)*field
	--if keyboard.btns.t.down == 1 then
	--	actualdist = dist3D(camera.pos.x,camera.pos.y,camera.pos.z,input_x,input_y,input_z)*field
	--end
		
	local distance = actualdist*math.cos(anglediff)
	local x = 0
	anglediff = math.deg(anglediff)
	if anglediff > 180 then
		anglediff = anglediff - 360
	elseif anglediff < -180 then
		anglediff = anglediff + 360	
	end

	anglediffy = math.deg(anglediffy)
	if anglediffy > 180 then
		anglediffy = anglediffy - 360
	elseif anglediffy < -180 then
		anglediffy = anglediffy + 360	
	end

	local a = 1

	local b = math.sqrt(2)

	x = s.w2 - s.w*(anglediff/camera.fov)*(-((b-a)/2)*math.cos(math.rad(anglediff)*math.pi/math.rad(camera.fov))+(a+b)/2)
	--x = s.w2 + s.w*math.sin((anglediff/camera.fov)*math.pi/2)
	local y = 0
	b=b*.7
	y = s.h2 + input_z/(distance) - s.h*(anglediffy/(camera.fov))*(-((b-a)/2)*math.cos(math.rad(anglediffy)*math.pi/math.rad(camera.fov))+(a+b)/2)
	if keyboard.btns.t.down == 1 then
		y = s.h2 + input_z/actualdist
	end
	local size = input_radius/distance
	local subs = math.floor(32*(1-(actualdist/8)^2))
	if subs <= 3 then
		subs = 3
	end



	--love.graphics.print()
	love.graphics.setColor(color)
	if math.abs(anglediff) < camera.fov/2 and distance > .0025 then
		--love.graphics.print(subs,x,y+10)
		love.graphics.circle(mode,x,y,size,subs)
		--love.graphics.print()
	end

end


function printer3D(input_text,input_x,input_y,input_z)
	local pi = math.pi
	local field = .13/120
	local flat = 120/.13
	local angle = math.atan2((input_y-camera.pos.y),(input_x-camera.pos.x))--%(2*math.pi)
	local angley = math.atan2((input_z-camera.pos.z),math.cos(angle)*(input_x-camera.pos.x)+math.sin(angle)*(input_y-camera.pos.y))
	local anglediff = camera.angle - angle
	local anglediffy = camera.angle2 - angley
	local actualdist = dist(camera.pos.x,camera.pos.y,input_x,input_y)*field
	local distance = actualdist*math.cos(anglediff)
	local x = 0
	anglediff = math.deg(anglediff)
	anglediffy = math.deg(anglediffy)
	if anglediff > 180 then
		anglediff = anglediff - 360
	elseif anglediff < -180 then
		anglediff = anglediff + 360	
	end
	local a = 1

	local b = math.sqrt(2)

	x = s.w2 - s.w*(anglediff/camera.fov)*(-((b-a)/2)*math.cos(math.rad(anglediff)*math.pi/math.rad(camera.fov))+(a+b)/2)


	--x = s.w2 - s.w*(anglediff/camera.fov)
	--x = s.w2 + s.w*math.sin((anglediff/camera.fov)*math.pi/2)
	local y = 0
	y = s.h2 + input_z/(distance) - s.h*(anglediffy/camera.fov)*(-((b-a)/2)*math.cos(math.rad(anglediffy)*math.pi/math.rad(camera.fov))+(a+b)/2)
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